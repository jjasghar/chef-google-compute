# Add our google/ lib
$LOAD_PATH.unshift ::File.expand_path('../libraries', ::File.dirname(__FILE__))

require 'chef/resource'
require 'google/hash_utils'
require 'google/property/enum'
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
    class DiskType < Chef::Resource
      resource_name :gcompute_disk_type

      property :creation_timestamp, Time, desired_state: true
      property :default_disk_size_gb, Integer, desired_state: true
      property :deprecated_deleted, Time, desired_state: true
      property :deprecated_deprecated, Time, desired_state: true
      property :deprecated_obsolete, Time, desired_state: true
      property :deprecated_replacement, String, desired_state: true
      property :deprecated_state,
               equal_to: %w[DEPRECATED OBSOLETE DELETED], desired_state: true
      property :description, String, desired_state: true
      property :id, Integer, desired_state: true
      property :dt_label, String, name_property: true, desired_state: true
      property :valid_disk_size, String, desired_state: true
      property :zone, String, desired_state: true

      property :credential, String, desired_state: false, required: true
      property :project, String, desired_state: false, required: true

      action :create do
        fetch = fetch_resource(@new_resource, self_link(@new_resource),
                               'compute#diskType')
        if fetch.nil?
          converge_by "Creating gcompute_disk_type[#{name}]" do
            # TODO(nelsonjr): Show a list of variables to create
            # TODO(nelsonjr): Determine how to print green like update converge
            puts # making a newline until we find a better way TODO: find!
            compute_changes.each { |log| puts "    - #{log.strip}\n" }
            create_req = ::Google::Request::Post.new(collection(@new_resource),
                                                     fetch_auth(@new_resource),
                                                     'application/json',
                                                     resource_to_request)
            return_if_object create_req.send, 'compute#diskType'
          end
        else
          @current_resource = @new_resource.clone
          @current_resource.creation_timestamp =
            ::Google::Property::Time.parse(fetch['creationTimestamp'])
          @current_resource.default_disk_size_gb =
            ::Google::Property::Integer.parse(fetch['defaultDiskSizeGb'])
          @current_resource.deprecated_deleted = ::Google::Property::Time.parse(
            ::Google::HashUtils.navigate(fetch, %w[deprecated deleted])
          )
          @current_resource.deprecated_deprecated =
            ::Google::Property::Time.parse(
              ::Google::HashUtils.navigate(
                fetch, %w[deprecated deprecated]
              )
            )
          @current_resource.deprecated_obsolete =
            ::Google::Property::Time.parse(
              ::Google::HashUtils.navigate(
                fetch, %w[deprecated obsolete]
              )
            )
          @current_resource.deprecated_replacement =
            ::Google::Property::String.parse(
              ::Google::HashUtils.navigate(
                fetch, %w[deprecated replacement]
              )
            )
          @current_resource.deprecated_state = ::Google::Property::Enum.parse(
            ::Google::HashUtils.navigate(fetch, %w[deprecated state])
          )
          @current_resource.description =
            ::Google::Property::String.parse(fetch['description'])
          @current_resource.id = ::Google::Property::Integer.parse(fetch['id'])
          @current_resource.dt_label =
            ::Google::Property::String.parse(fetch['name'])
          @current_resource.valid_disk_size =
            ::Google::Property::String.parse(fetch['validDiskSize'])

          cannot_change_resource 'DiskType cannot be edited'
        end
      end

      action :delete do
        fetch = fetch_resource(@new_resource, self_link(@new_resource),
                               'compute#diskType')
        unless fetch.nil?
          converge_by "Deleting gcompute_disk_type[#{name}]" do
            delete_req =
              ::Google::Request::Delete.new(self_link(@new_resource),
                                            fetch_auth(@new_resource))
            return_if_object delete_req.send, 'compute#diskType'
          end
        end
      end

      # TODO(nelsonjr): Add actions :manage and :modify

      private

      action_class do
        def resource_to_request
          ::Google::HashUtils.camelize_keys(
            kind: 'compute#diskType'
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

        # rubocop:disable Metrics/MethodLength
        def self.resource_to_hash(resource)
          {
            project: resource.project,
            name: resource.dt_label,
            kind: 'compute#diskType',
            creation_timestamp: resource.creation_timestamp,
            default_disk_size_gb: resource.default_disk_size_gb,
            deprecated_deleted: resource.deprecated_deleted,
            deprecated_deprecated: resource.deprecated_deprecated,
            deprecated_obsolete: resource.deprecated_obsolete,
            deprecated_replacement: resource.deprecated_replacement,
            deprecated_state: resource.deprecated_state,
            description: resource.description,
            id: resource.id,
            valid_disk_size: resource.valid_disk_size,
            zone: resource.zone
          }.reject { |_, v| v.nil? }
        end
        # rubocop:enable Metrics/MethodLength

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
              'projects/{{project}}/zones/{{zone}}/diskTypes',
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
              'projects/{{project}}/zones/{{zone}}/diskTypes/{{name}}',
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

        def dirty_display_formatted
          @dirty.map do |name, change|
            ["#{name.id2name} expected #{change[:to]},",
             "but platform reports #{change[:from]}"].join(' ')
          end.join('. Also ')
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
