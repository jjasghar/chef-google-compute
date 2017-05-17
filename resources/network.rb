# Add our google/ lib
$LOAD_PATH.unshift ::File.expand_path('../libraries', ::File.dirname(__FILE__))

require 'chef/resource'
require 'google/hash_utils'
require 'google/property/array'
require 'google/property/boolean'
require 'google/property/integer'
require 'google/property/string'
require 'google/property/time'
require 'google/request/get'
require 'google/request/post'
require 'google/request/delete'

module Google
  module GCOMPUTE
    # A provider to manage Google Compute Engine resources.
    # rubocop:disable Metrics/ClassLength
    class Network < Chef::Resource
      resource_name :gcompute_network

      property :description, String, desired_state: true
      property :gateway_ipv4, String, desired_state: true
      property :id, Integer, desired_state: true
      property :ipv4_range, String, desired_state: true
      property :n_label, String, name_property: true, desired_state: true
      property :subnetworks, Array, desired_state: true
      property :auto_create_subnetworks,
               kind_of: [TrueClass, FalseClass], desired_state: true
      property :creation_timestamp, Time, desired_state: true

      property :credential, String, desired_state: false, required: true
      property :project, String, desired_state: false, required: true

      action :create do
        fetch = fetch_resource(@new_resource, self_link(@new_resource),
                               'compute#network')
        if fetch.nil?
          converge_by "Creating gcompute_network[#{name}]" do
            # TODO(nelsonjr): Show a list of variables to create
            # TODO(nelsonjr): Determine how to print green like update converge
            puts # making a newline until we find a better way TODO: find!
            compute_changes.each { |log| puts "    - #{log.strip}\n" }
            create_req = ::Google::Request::Post.new(collection(@new_resource),
                                                     fetch_auth(@new_resource),
                                                     'application/json',
                                                     resource_to_request)
            wait_for_operation create_req.send, @new_resource
          end
        else
          @current_resource = @new_resource.clone
          @current_resource.description =
            ::Google::Property::String.parse(fetch['description'])
          @current_resource.gateway_ipv4 =
            ::Google::Property::String.parse(fetch['gatewayIPv4'])
          @current_resource.id = ::Google::Property::Integer.parse(fetch['id'])
          @current_resource.ipv4_range =
            ::Google::Property::String.parse(fetch['IPv4Range'])
          @current_resource.n_label =
            ::Google::Property::String.parse(fetch['name'])
          @current_resource.subnetworks =
            ::Google::Property::Array.parse(fetch['subnetworks'])
          @current_resource.auto_create_subnetworks =
            ::Google::Property::Boolean.parse(fetch['autoCreateSubnetworks'])
          @current_resource.creation_timestamp =
            ::Google::Property::Time.parse(fetch['creationTimestamp'])

          cannot_change_resource 'Network cannot be edited'
        end
      end

      action :delete do
        fetch = fetch_resource(@new_resource, self_link(@new_resource),
                               'compute#network')
        unless fetch.nil?
          converge_by "Deleting gcompute_network[#{name}]" do
            delete_req =
              ::Google::Request::Delete.new(self_link(@new_resource),
                                            fetch_auth(@new_resource))
            wait_for_operation delete_req.send, @new_resource
          end
        end
      end

      # TODO(nelsonjr): Add actions :manage and :modify

      private

      action_class do
        def resource_to_request
          ::Google::HashUtils.camelize_keys(
            kind: 'compute#network',
            description: description,
            gatewayIPv4: gateway_ipv4,
            IPv4Range: ipv4_range,
            name: n_label,
            autoCreateSubnetworks: auto_create_subnetworks
          ).reject { |_, v| v.nil? }.to_json
        end

        def cannot_change_resource(message)
          converge_if_changed do |_vars|
            # TODO(nelsonjr): Determine how to print indented like upd converge
            # TODO(nelsonjr): Check w/ Chef... can we print this in red?
            puts # making a newline until we find a better way TODO: find!
            compute_changes.each { |log| puts "    - #{log.strip}\n" }
            Chef::Log.fatal message
            raise message
          end
        end

        def self.resource_to_hash(resource)
          {
            project: resource.project,
            name: resource.n_label,
            kind: 'compute#network',
            description: resource.description,
            gateway_ipv4: resource.gateway_ipv4,
            id: resource.id,
            ipv4_range: resource.ipv4_range,
            subnetworks: resource.subnetworks,
            auto_create_subnetworks: resource.auto_create_subnetworks,
            creation_timestamp: resource.creation_timestamp
          }.reject { |_, v| v.nil? }
        end

        # Copied from Chef > Provider > #converge_if_changed
        def compute_changes
          properties = @new_resource.class.state_properties.map(&:name)
          properties = properties.map(&:to_sym)
          if current_resource
            compute_changes_for_existing_resource properties
          else
            compute_changes_for_new_resource properties
          end
        end

        # Collect the list of modified properties
        def compute_changes_for_existing_resource(properties)
          specified_properties = properties.select do |property|
            @new_resource.property_is_set?(property)
          end
          modified = specified_properties.reject do |p|
            @new_resource.send(p) == current_resource.send(p)
          end

          generate_pretty_green_text(modified)
        end

        def generate_pretty_green_text(modified)
          property_size = modified.map(&:size).max
          modified.map! do |p|
            properties_str = if @new_resource.sensitive
                               '(suppressed sensitive property)'
                             else
                               [
                                 @new_resource.send(p).inspect,
                                 "(was #{current_resource.send(p).inspect})"
                               ].join(' ')
                             end
            "  set #{p.to_s.ljust(property_size)} to #{properties_str}"
          end
        end

        # Write down any properties we are setting.
        def compute_changes_for_new_resource(properties)
          property_size = properties.map(&:size).max
          properties.map do |property|
            default = ' (default value)' \
              unless @new_resource.property_is_set?(property)
            next if @new_resource.send(property).nil?
            properties_str = if @new_resource.sensitive
                               '(suppressed sensitive property)'
                             else
                               @new_resource.send(property).inspect
                             end
            ["  set #{property.to_s.ljust(property_size)}",
             "to #{properties_str}#{default}"].join(' ')
          end.compact
        end

        def fetch_auth(resource)
          self.class.fetch_auth(resource)
        end

        def self.fetch_auth(resource)
          resource.resources("gauth_credential[#{resource.credential}]")
                  .authorization
        end

        def fetch_resource(resource, self_link, kind)
          self.class.fetch_resource(resource, self_link, kind)
        end

        def debug(message)
          Chef::Log.debug(message)
        end

        def self.collection(data)
          URI.join(
            'https://www.googleapis.com/compute/v1/',
            expand_variables(
              'projects/{{project}}/global/networks',
              data
            )
          )
        end

        def collection(data)
          self.class.collection(data)
        end

        def self.self_link(data)
          URI.join(
            'https://www.googleapis.com/compute/v1/',
            expand_variables(
              'projects/{{project}}/global/networks/{{name}}',
              data
            )
          )
        end

        def self_link(data)
          self.class.self_link(data)
        end

        def self.return_if_object(response, kind)
          raise "Bad response: #{response}" \
            unless response.is_a?(Net::HTTPResponse)
          return if response.is_a?(Net::HTTPNotFound)
          return if response.is_a?(Net::HTTPNoContent)
          result = JSON.parse(response.body)
          raise_if_errors result, %w[error errors], 'message'
          raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
          raise "Incorrect result: #{result['kind']} (expecting #{kind})" \
            unless result['kind'] == kind
          result
        end

        def return_if_object(response, kind)
          self.class.return_if_object(response, kind)
        end

        def self.extract_variables(template)
          template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
                  .map(&:to_sym)
        end

        def self.expand_variables(template, var_data, extra_data = {})
          data = if var_data.class <= Hash
                   var_data.merge(extra_data)
                 else
                   resource_to_hash(var_data).merge(extra_data)
                 end
          extract_variables(template).each do |v|
            unless data.key?(v)
              raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
            end
            template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
          end
          template
        end

        def expand_variables(template, var_data, extra_data = {})
          self.class.expand_variables(template, var_data, extra_data)
        end

        def fetch_resource(resource, self_link, kind)
          self.class.fetch_resource(resource, self_link, kind)
        end

        def async_op_url(data, extra_data = {})
          URI.join(
            'https://www.googleapis.com/compute/v1/',
            expand_variables(
              'projects/{{project}}/global/operations/{{op_id}}',
              data, extra_data
            )
          )
        end

        def wait_for_operation(response, resource)
          op_result = return_if_object(response, 'compute#operation')
          status = ::Google::HashUtils.navigate(op_result, %w[status])
          wait_done = wait_for_completion(status, op_result, resource)
          fetch_resource(
            resource,
            URI.parse(::Google::HashUtils.navigate(wait_done,
                                                   %w[targetLink])),
            'compute#network'
          )
        end

        def wait_for_completion(status, op_result, resource)
          op_id = ::Google::HashUtils.navigate(op_result, %w[name])
          op_uri = async_op_url(resource, op_id: op_id)
          while status != 'DONE'
            debug("Waiting for completion of operation #{op_id}")
            raise_if_errors op_result, %w[error errors], 'message'
            sleep 1.0
            raise "Invalid result '#{status}' on gcompute_network." \
              unless %w[PENDING RUNNING DONE].include?(status)
            op_result = fetch_resource(resource, op_uri, 'compute#operation')
            status = ::Google::HashUtils.navigate(op_result, %w[status])
          end
          op_result
        end

        def raise_if_errors(response, err_path, msg_field)
          self.class.raise_if_errors(response, err_path, msg_field)
        end

        def handle_auto_to_custom_change
          # We allow changing the auto_create_subnetworks from true => false
          # (which will make the network going from Auto to Custom)
          auto_change = @dirty[:auto_create_subnetworks]
          raise 'Cannot convert a network from Custom back to Auto' \
            if auto_change[:from] == false && auto_change[:to] == true
          # TODO(nelsonjr): Enable converting from Auto => Custom via call to
          # special method URL. See tracking work item:
          # https://bugzilla.graphite.cloudnativeapp.com/show_bug.cgi?id=174
          raise [
            'Conversion from Auto to Custom not implemented yet.',
            'See', ['https://bugzilla.graphite.cloudnativeapp.com',
                    'show_bug.cgi?id=174'].join('/'),
            'for more details'
          ].join(' ')
        end

        def self.fetch_resource(resource, self_link, kind)
          get_request = ::Google::Request::Get.new(self_link,
                                                   fetch_auth(resource))
          return_if_object get_request.send, kind
        end

        def self.raise_if_errors(response, err_path, msg_field)
          errors = ::Google::HashUtils.navigate(response, err_path)
          raise_error(errors, msg_field) unless errors.nil?
        end

        def self.raise_error(errors, msg_field)
          raise IOError, ['Operation failed:',
                          errors.map { |e| e[msg_field] }.join(', ')].join(' ')
        end
      end
    end
    # rubocop:enable Metrics/ClassLength
  end
end
