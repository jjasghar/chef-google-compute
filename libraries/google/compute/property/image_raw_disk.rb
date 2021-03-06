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
      # A class to manage data for raw_disk for image.
      class ImageRawDisk
        include Comparable

        attr_reader :container_type
        attr_reader :sha1_checksum
        attr_reader :source

        def to_json(_arg = nil)
          {
            'containerType' => container_type,
            'sha1Checksum' => sha1_checksum,
            'source' => source
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            container_type: container_type.to_s,
            sha1_checksum: sha1_checksum.to_s,
            source: source.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? ImageRawDisk
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? ImageRawDisk
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
            { self: container_type, other: other.container_type },
            { self: sha1_checksum, other: other.sha1_checksum },
            { self: source, other: other.source }
          ]
        end
      end

      # Manages a ImageRawDisk nested object
      # Data is coming from the GCP API
      class ImageRawDiskApi < ImageRawDisk
        def initialize(args)
          @container_type =
            Google::Compute::Property::Enum.api_parse(args['containerType'])
          @sha1_checksum =
            Google::Compute::Property::String.api_parse(args['sha1Checksum'])
          @source = Google::Compute::Property::String.api_parse(args['source'])
        end
      end

      # Manages a ImageRawDisk nested object
      # Data is coming from the Chef catalog
      class ImageRawDiskCatalog < ImageRawDisk
        def initialize(args)
          @container_type =
            Google::Compute::Property::Enum.catalog_parse(args[:container_type])
          @sha1_checksum = Google::Compute::Property::String.catalog_parse(
            args[:sha1_checksum]
          )
          @source =
            Google::Compute::Property::String.catalog_parse(args[:source])
        end
      end
    end

    module Property
      # A class to manage input to raw_disk for image.
      class ImageRawDisk
        def self.coerce
          ->(x) { ::Google::Compute::Property::ImageRawDisk.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::ImageRawDisk
          Data::ImageRawDiskCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::ImageRawDisk
          Data::ImageRawDiskApi.new(value)
        end
      end
    end
  end
end
