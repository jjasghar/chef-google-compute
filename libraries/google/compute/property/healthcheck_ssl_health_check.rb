# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by chef-codegen and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

module Google
  module Compute
    module Data
      # A class to manage data for ssl_health_check for health_check.
      class HealChecSslHealChec
        include Comparable

        attr_reader :request
        attr_reader :response
        attr_reader :port
        attr_reader :port_name
        attr_reader :proxy_header

        def to_json(_arg = nil)
          {
            'request' => request,
            'response' => response,
            'port' => port,
            'portName' => port_name,
            'proxyHeader' => proxy_header
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            request: request.to_s,
            response: response.to_s,
            port: port.to_s,
            port_name: port_name.to_s,
            proxy_header: proxy_header.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? HealChecSslHealChec
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? HealChecSslHealChec
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        def inspect
          to_json
        end

        private

        def compare_fields(other)
          [
            { self: request, other: other.request },
            { self: response, other: other.response },
            { self: port, other: other.port },
            { self: port_name, other: other.port_name },
            { self: proxy_header, other: other.proxy_header }
          ]
        end
      end

      # Manages a HealChecSslHealChec nested object
      # Data is coming from the GCP API
      class HealChecSslHealChecApi < HealChecSslHealChec
        def initialize(args)
          @request =
            Google::Compute::Property::String.api_parse(args['request'])
          @response =
            Google::Compute::Property::String.api_parse(args['response'])
          @port = Google::Compute::Property::Integer.api_parse(args['port'])
          @port_name =
            Google::Compute::Property::String.api_parse(args['portName'])
          @proxy_header =
            Google::Compute::Property::Enum.api_parse(args['proxyHeader'])
        end
      end

      # Manages a HealChecSslHealChec nested object
      # Data is coming from the Chef catalog
      class HealChecSslHealChecCatalog < HealChecSslHealChec
        def initialize(args)
          @request =
            Google::Compute::Property::String.catalog_parse(args[:request])
          @response =
            Google::Compute::Property::String.catalog_parse(args[:response])
          @port = Google::Compute::Property::Integer.catalog_parse(args[:port])
          @port_name =
            Google::Compute::Property::String.catalog_parse(args[:port_name])
          @proxy_header =
            Google::Compute::Property::Enum.catalog_parse(args[:proxy_header])
        end
      end
    end

    module Property
      # A class to manage input to ssl_health_check for health_check.
      class HealChecSslHealChec
        def self.coerce
          lambda do |x|
            ::Google::Compute::Property::HealChecSslHealChec.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::HealChecSslHealChec
          Data::HealChecSslHealChecCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::HealChecSslHealChec
          Data::HealChecSslHealChecApi.new(value)
        end
      end
    end
  end
end
