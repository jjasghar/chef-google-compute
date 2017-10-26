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

require 'google/compute/property/array'
module Google
  module Compute
    module Data
      # A class to manage data for named_ports for instance_group_manager.
      class InstGrouManaNamePort
        include Comparable

        attr_reader :name
        attr_reader :port

        def to_json(_arg = nil)
          {
            'name' => name,
            'port' => port
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            name: name.to_s,
            port: port.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstGrouManaNamePort
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstGrouManaNamePort
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
            { self: name, other: other.name },
            { self: port, other: other.port }
          ]
        end
      end

      # Manages a InstGrouManaNamePort nested object
      # Data is coming from the GCP API
      class InstGrouManaNamePortApi < InstGrouManaNamePort
        def initialize(args)
          @name = Google::Compute::Property::String.api_parse(args['name'])
          @port = Google::Compute::Property::Integer.api_parse(args['port'])
        end
      end

      # Manages a InstGrouManaNamePort nested object
      # Data is coming from the Chef catalog
      class InstGrouManaNamePortCatalog < InstGrouManaNamePort
        def initialize(args)
          @name = Google::Compute::Property::String.catalog_parse(args[:name])
          @port = Google::Compute::Property::Integer.catalog_parse(args[:port])
        end
      end
    end

    module Property
      # A class to manage input to named_ports for instance_group_manager.
      class InstGrouManaNamePort
        def self.coerce
          lambda do |x|
            ::Google::Compute::Property::InstGrouManaNamePort.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstGrouManaNamePort
          Data::InstGrouManaNamePortCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstGrouManaNamePort
          Data::InstGrouManaNamePortApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class InstGrouManaNamePortArray < Google::Compute::Property::Array
        def self.coerce
          lambda do |x|
            type = ::Google::Compute::Property::InstGrouManaNamePortArray
            type.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return InstGrouManaNamePort.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstGrouManaNamePort.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return InstGrouManaNamePort.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstGrouManaNamePort.api_parse(v) }
        end
      end
    end
  end
end
