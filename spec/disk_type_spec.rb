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
# ----------------------------------------------------------------------------

require 'spec_helper'
# TODO(alexstephen): Reformat tests to use nested describe blocks
# TODO(alexstephen): Add title == name tests
# Test Matrix:
#
# +--------------------------------------------------------+
# | Action  | Exists | Changes | Success | Result          |
# +--------------------------------------------------------+
# | create  | Y      | Y       | Y       | Edit            |
# | create  | Y      | Y       | N       | Fail            |
# | create  | Y      | N       | Y       | Fetch (no-op)   |
# | create  | Y      | N       | N       | Fail            |
# | create  | N      | Y       | Y       | Create          |
# | create  | N      | Y       | N       | Fail            |
# +--------------------------------------------------------+
# | delete  | Y      | Y       | Y       | Delete          |
# | delete  | Y      | Y       | N       | Fail            |
# | delete  | N      | Y       | Y       | Fail (no delete)|
# | delete  | N      | Y       | N       | Fail            |
# +--------------------------------------------------------+
# TODO(alexstephen): Add tests for manage
# TODO(alexstephen): Add tests for modify
context 'gcompute_disk_type' do
  DT_PROJECT_DATA = %w[
    test\ project#0\ data
    test\ project#1\ data
    test\ project#2\ data
    test\ project#3\ data
    test\ project#4\ data
  ].freeze

  DT_ZONE_DATA = %w[
    test\ zone#0\ data
    test\ zone#1\ data
    test\ zone#2\ data
    test\ zone#3\ data
    test\ zone#4\ data
  ].freeze

  DT_NAME_DATA = %w[
    test\ name#0\ data
    test\ name#1\ data
    test\ name#2\ data
    test\ name#3\ data
    test\ name#4\ data
  ].freeze

  context 'resource exists' do
    # Ensure ignore: resource exists, no change
    context 'no changes == no action' do
      # Ensure ignore: resource exists, no change, no name, pass
      context 'title == name (pass)' do
        before do
          allow(Time).to receive(:now).and_return(
            Time.new(2017, 1, 2, 3, 4, 5)
          )
          expect_network_get_success 1, name: 'title0'
          expect_network_get_success 2, name: 'title1'
          expect_network_get_success 3, name: 'title2'
        end

        let(:runner) do
          cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                            File.join(File.dirname(__FILE__), 'cookbooks')]
          ChefSpec::SoloRunner.new(
            step_into: 'gcompute_disk_type',
            cookbook_path: cookbook_paths,
            platform: 'ubuntu',
            version: '16.04'
          )
        end

        let(:chef_run) do
          r_name = ['gcompute::tests~gcompute_disk_type~create~exist',
                    '~nochange~title_eq_name'].join
          runner.converge(r_name) do
            cred = Google::CredentialResourceMock.new('mycred',
                                                      runner.run_context)
            runner.resource_collection.insert(cred)
          end
        end

        context 'gcompute_disk_type[title0]' do
          subject do
            chef_run.find_resource(:gcompute_disk_type, 'title0')
          end
          it { is_expected.to have_attributes(zone: 'test zone#0 data') }
        end

        context 'gcompute_disk_type[title1]' do
          subject do
            chef_run.find_resource(:gcompute_disk_type, 'title1')
          end
          it { is_expected.to have_attributes(zone: 'test zone#1 data') }
        end

        context 'gcompute_disk_type[title2]' do
          subject do
            chef_run.find_resource(:gcompute_disk_type, 'title2')
          end
          it { is_expected.to have_attributes(zone: 'test zone#2 data') }
        end
      end

      # Ensure ignore: resource exists, no change, has name, pass
      context 'title != name (pass)' do
        before do
          allow(Time).to receive(:now).and_return(
            Time.new(2017, 1, 2, 3, 4, 5)
          )
          expect_network_get_success 1
          expect_network_get_success 2
          expect_network_get_success 3
        end

        let(:runner) do
          cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                            File.join(File.dirname(__FILE__), 'cookbooks')]
          ChefSpec::SoloRunner.new(
            step_into: 'gcompute_disk_type',
            cookbook_path: cookbook_paths,
            platform: 'ubuntu',
            version: '16.04'
          )
        end

        let(:chef_run) do
          r_name = ['gcompute::tests~gcompute_disk_type~create~exist',
                    '~nochange~title_and_name'].join
          runner.converge(r_name) do
            cred = Google::CredentialResourceMock.new('mycred',
                                                      runner.run_context)
            runner.resource_collection.insert(cred)
          end
        end

        context 'gcompute_disk_type[title0]' do
          subject do
            chef_run.find_resource(:gcompute_disk_type, 'title0')
          end
          it { is_expected.to have_attributes(zone: 'test zone#0 data') }
        end

        context 'gcompute_disk_type[title1]' do
          subject do
            chef_run.find_resource(:gcompute_disk_type, 'title1')
          end
          it { is_expected.to have_attributes(zone: 'test zone#1 data') }
        end

        context 'gcompute_disk_type[title2]' do
          subject do
            chef_run.find_resource(:gcompute_disk_type, 'title2')
          end
          it { is_expected.to have_attributes(zone: 'test zone#2 data') }
        end
      end
    end

    # Ensure ignore: resource exists, changes
    context 'changes == action' do
      # Ensure ignore: resource exists, changes, no name, fail
      context 'title == name (fail)' do
        # TODO(alexstephen): Implement new test format.
        subject { -> { raise '[placeholder] This should fail.' } }
        it { is_expected.to raise_error(RuntimeError, /placeholder/) }
      end

      # Ensure ignore: resource exists, changes, has name, fail
      context 'title != name (fail)' do
        # TODO(alexstephen): Implement new test format.
        subject { -> { raise '[placeholder] This should fail.' } }
        it { is_expected.to raise_error(RuntimeError, /placeholder/) }
      end
    end
  end

  context 'resource missing' do
    # Ensure ignore: resource missing, ignore, no name, fail
    context 'title == name (fail)' do
      # TODO(alexstephen): Implement new test format.
      subject { -> { raise '[placeholder] This should fail.' } }
      it { is_expected.to raise_error(RuntimeError, /placeholder/) }
    end

    # Ensure ignore: resource missing, ignore, has name, fail
    context 'title != name (fail)' do
      # TODO(alexstephen): Implement new test format.
      subject { -> { raise '[placeholder] This should fail.' } }
      it { is_expected.to raise_error(RuntimeError, /placeholder/) }
    end
  end

  def expand_variables(template, data, extra_data = {})
    Google::GCOMPUTE::DiskType
      .action_class.expand_variables(template, data, extra_data)
  end

  def expect_network_get_success(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result("success#{id}~#{id_data}.yaml").to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Request::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug ">> GET #{args}"
      request
    end
  end

  def http_success(body)
    response = Net::HTTPOK.new(1.0, 200, 'OK')
    response.body = body
    response.instance_variable_set(:@read, true)
    response
  end

  def expect_network_get_failed(id, data = {})
    request = double('request')
    allow(request).to receive(:send).and_return(http_failed_object_missing)

    expect(Google::Request::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug ">> GET [failed] #{args}"
      request
    end
  end

  def http_failed_object_missing
    Net::HTTPNotFound.new(1.0, 404, 'Not Found')
  end

  def load_network_result(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_disk_type', file)
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def debug(message)
    puts(message) if ENV['RSPEC_DEBUG']
  end

  def collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/diskTypes',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/zones/{{zone}}/diskTypes/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: DT_PROJECT_DATA[(id - 1) % DT_PROJECT_DATA.size],
      zone: DT_ZONE_DATA[(id - 1) % DT_ZONE_DATA.size],
      name: DT_NAME_DATA[(id - 1) % DT_NAME_DATA.size]
    }
  end
end
