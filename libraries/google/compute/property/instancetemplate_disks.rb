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
      # A class to manage data for disks for instance_template.
      class InstancTemplatDisks
        include Comparable

        attr_reader :auto_delete
        attr_reader :boot
        attr_reader :device_name
        attr_reader :disk_encryption_key
        attr_reader :index
        attr_reader :initialize_params
        attr_reader :interface
        attr_reader :mode
        attr_reader :source
        attr_reader :type

        def to_json(_arg = nil)
          {
            'autoDelete' => auto_delete,
            'boot' => boot,
            'deviceName' => device_name,
            'diskEncryptionKey' => disk_encryption_key,
            'index' => index,
            'initializeParams' => initialize_params,
            'interface' => interface,
            'mode' => mode,
            'source' => source,
            'type' => type
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            auto_delete: auto_delete.to_s,
            boot: boot.to_s,
            device_name: device_name.to_s,
            disk_encryption_key: disk_encryption_key.to_s,
            index: index.to_s,
            initialize_params: initialize_params.to_s,
            interface: interface.to_s,
            mode: mode.to_s,
            source: source.to_s,
            type: type.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstancTemplatDisks
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancTemplatDisks
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
            { self: auto_delete, other: other.auto_delete },
            { self: boot, other: other.boot },
            { self: device_name, other: other.device_name },
            { self: disk_encryption_key, other: other.disk_encryption_key },
            { self: index, other: other.index },
            { self: initialize_params, other: other.initialize_params },
            { self: interface, other: other.interface },
            { self: mode, other: other.mode },
            { self: source, other: other.source },
            { self: type, other: other.type }
          ]
        end
      end

      # Manages a InstancTemplatDisks nested object
      # Data is coming from the GCP API
      class InstancTemplatDisksApi < InstancTemplatDisks
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @auto_delete =
            Google::Compute::Property::Boolean.api_parse(args['autoDelete'])
          @boot = Google::Compute::Property::Boolean.api_parse(args['boot'])
          @device_name =
            Google::Compute::Property::String.api_parse(args['deviceName'])
          @disk_encryption_key =
            Google::Compute::Property::InstTempDiskEncrKey.api_parse(
              args['diskEncryptionKey']
            )
          @index = Google::Compute::Property::Integer.api_parse(args['index'])
          @initialize_params =
            Google::Compute::Property::InstaTemplInitiParam.api_parse(
              args['initializeParams']
            )
          @interface =
            Google::Compute::Property::Enum.api_parse(args['interface'])
          @mode = Google::Compute::Property::Enum.api_parse(args['mode'])
          @source =
            Google::Compute::Property::DiskNameRef.api_parse(args['source'])
          @type = Google::Compute::Property::Enum.api_parse(args['type'])
        end
        # rubocop:enable Metrics/MethodLength
      end

      # Manages a InstancTemplatDisks nested object
      # Data is coming from the Chef catalog
      class InstancTemplatDisksCatalog < InstancTemplatDisks
        # rubocop:disable Metrics/MethodLength
        def initialize(args)
          @auto_delete =
            Google::Compute::Property::Boolean.catalog_parse(args[:auto_delete])
          @boot = Google::Compute::Property::Boolean.catalog_parse(args[:boot])
          @device_name =
            Google::Compute::Property::String.catalog_parse(args[:device_name])
          @disk_encryption_key =
            Google::Compute::Property::InstTempDiskEncrKey.catalog_parse(
              args[:disk_encryption_key]
            )
          @index =
            Google::Compute::Property::Integer.catalog_parse(args[:index])
          @initialize_params =
            Google::Compute::Property::InstaTemplInitiParam.catalog_parse(
              args[:initialize_params]
            )
          @interface =
            Google::Compute::Property::Enum.catalog_parse(args[:interface])
          @mode = Google::Compute::Property::Enum.catalog_parse(args[:mode])
          @source =
            Google::Compute::Property::DiskNameRef.catalog_parse(args[:source])
          @type = Google::Compute::Property::Enum.catalog_parse(args[:type])
        end
        # rubocop:enable Metrics/MethodLength
      end
    end

    module Property
      # A class to manage input to disks for instance_template.
      class InstancTemplatDisks
        def self.coerce
          lambda do |x|
            ::Google::Compute::Property::InstancTemplatDisks.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstancTemplatDisks
          Data::InstancTemplatDisksCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstancTemplatDisks
          Data::InstancTemplatDisksApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class InstancTemplatDisksArray < Google::Compute::Property::Array
        def self.coerce
          lambda do |x|
            type = ::Google::Compute::Property::InstancTemplatDisksArray
            type.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return InstancTemplatDisks.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancTemplatDisks.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return InstancTemplatDisks.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancTemplatDisks.api_parse(v) }
        end
      end
    end
  end
end
