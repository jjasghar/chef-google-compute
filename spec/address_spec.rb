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
context 'gcompute_address' do
  A_PROJECT_DATA = %w[
    test\ project#0\ data
    test\ project#1\ data
    test\ project#2\ data
    test\ project#3\ data
    test\ project#4\ data
  ].freeze

  A_REGION_DATA = %w[
    resource(region,0)
    resource(region,1)
    resource(region,2)
    resource(region,3)
    resource(region,4)
  ].freeze

  A_NAME_DATA = %w[
    test\ name#0\ data
    test\ name#1\ data
    test\ name#2\ data
    test\ name#3\ data
    test\ name#4\ data
  ].freeze

  context 'ensure == present' do
    context 'resource exists' do
      # Ensure present: resource exists, no change
      context 'no changes == no action' do
        # Ensure present: resource exists, no change, no name
        context 'title == name' do
          # Ensure present: resource exists, no change, no name, pass
          context 'title == name (pass)' do
            before do
              allow(Time).to receive(:now).and_return(
                Time.new(2017, 1, 2, 3, 4, 5)
              )
              expect_network_get_success 1, name: 'title0',
                                            region: 'test name#0 data'
              expect_network_get_success 2, name: 'title1',
                                            region: 'test name#1 data'
              expect_network_get_success 3, name: 'title2',
                                            region: 'test name#2 data'
              expect_network_get_success_region 1
              expect_network_get_success_region 2
              expect_network_get_success_region 3
            end

            let(:runner) do
              cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                                File.join(File.dirname(__FILE__), 'cookbooks')]
              ChefSpec::SoloRunner.new(
                step_into: %w[gcompute_address gcompute_region],
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              recipe = ['gcompute::tests', 'gcompute_address',
                        'create', 'exist', 'nochange',
                        'title_eq_name'].join('~')
              runner.converge(recipe) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end

            context 'gcompute_address[title0]' do
              subject do
                chef_run.find_resource(:gcompute_address, 'title0')
              end

              it do
                is_expected.to have_attributes(address: 'test address#0 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#0 data')
              end

              it { is_expected.to have_attributes(a_label: 'title0') }

              # TODO(alexstephen): Implement resourceref test.
              # it 'region' do
              #   # Add test code here
              # end
            end

            context 'gcompute_address[title1]' do
              subject do
                chef_run.find_resource(:gcompute_address, 'title1')
              end

              it do
                is_expected.to have_attributes(address: 'test address#1 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#1 data')
              end

              it { is_expected.to have_attributes(a_label: 'title1') }

              # TODO(alexstephen): Implement resourceref test.
              # it 'region' do
              #   # Add test code here
              # end
            end

            context 'gcompute_address[title2]' do
              subject do
                chef_run.find_resource(:gcompute_address, 'title2')
              end

              it do
                is_expected.to have_attributes(address: 'test address#2 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#2 data')
              end

              it { is_expected.to have_attributes(a_label: 'title2') }

              # TODO(alexstephen): Implement resourceref test.
              # it 'region' do
              #   # Add test code here
              # end
            end
          end

          # Ensure present: resource exists, no change, no name, fail
          context 'title == name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end

        # Ensure present: resource exists, no change, has name
        context 'title != name' do
          # Ensure present: resource exists, no change, has name, pass
          context 'title != name (pass)' do
            before do
              allow(Time).to receive(:now).and_return(
                Time.new(2017, 1, 2, 3, 4, 5)
              )
              expect_network_get_success 1, region: 'test name#0 data'
              expect_network_get_success 2, region: 'test name#1 data'
              expect_network_get_success 3, region: 'test name#2 data'
              expect_network_get_success_region 1
              expect_network_get_success_region 2
              expect_network_get_success_region 3
            end

            let(:runner) do
              cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                                File.join(File.dirname(__FILE__), 'cookbooks')]
              ChefSpec::SoloRunner.new(
                step_into: %w[gcompute_address gcompute_region],
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              recipe = ['gcompute::tests', 'gcompute_address',
                        'create', 'exist', 'nochange',
                        'title_and_name'].join('~')
              runner.converge(recipe) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end

            context 'gcompute_address[title0]' do
              subject do
                chef_run.find_resource(:gcompute_address, 'title0')
              end

              it do
                is_expected.to have_attributes(address: 'test address#0 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#0 data')
              end

              it { is_expected.to have_attributes(a_label: 'test name#0 data') }

              # TODO(alexstephen): Implement resourceref test.
              # it 'region' do
              #   # Add test code here
              # end
            end

            context 'gcompute_address[title1]' do
              subject do
                chef_run.find_resource(:gcompute_address, 'title1')
              end

              it do
                is_expected.to have_attributes(address: 'test address#1 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#1 data')
              end

              it { is_expected.to have_attributes(a_label: 'test name#1 data') }

              # TODO(alexstephen): Implement resourceref test.
              # it 'region' do
              #   # Add test code here
              # end
            end

            context 'gcompute_address[title2]' do
              subject do
                chef_run.find_resource(:gcompute_address, 'title2')
              end

              it do
                is_expected.to have_attributes(address: 'test address#2 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#2 data')
              end

              it { is_expected.to have_attributes(a_label: 'test name#2 data') }

              # TODO(alexstephen): Implement resourceref test.
              # it 'region' do
              #   # Add test code here
              # end
            end
          end

          # Ensure present: resource exists, no change, has name, fail
          context 'title != name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end
      end

      # Ensure present: resource exists, changes
      context 'changes == action' do
        # Ensure present: resource exists, changes, no name
        context 'title == name' do
          # Ensure present: resource exists, changes, no name, pass
          context 'title == name (pass)' do
            # TODO(alexstephen): Implement new test format.
          end

          # Ensure present: resource exists, changes, no name, fail
          context 'title == name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end

        # Ensure present: resource exists, changes, has name
        context 'title != name' do
          # Ensure present: resource exists, changes, has name, pass
          context 'title != name (pass)' do
            # TODO(alexstephen): Implement new test format
          end

          # Ensure present: resource exists, changes, has name, fail
          context 'title != name (fail)' do
            # TODO(alexstephen): Implement new test format.
            subject { -> { raise '[placeholder] This should fail.' } }
            it { is_expected.to raise_error(RuntimeError, /placeholder/) }
          end
        end
      end
    end

    context 'resource missing' do
      # Ensure present: resource missing, ignore, no name
      context 'title == name' do
        # Ensure present: resource missing, ignore, no name, pass
        context 'title == name (pass)' do
          before do
            expect_network_get_failed 1, name: 'title0',
                                         region: 'test name#0 data'
            expect_network_create \
              1,
              {
                'kind' => 'compute#address',
                'address' => 'test address#0 data',
                'description' => 'test description#0 data',
                'name' => 'title0'
              },
              name: 'title0',
              region: 'test name#0 data'
            expect_network_get_async 1, name: 'title0',
                                        region: 'test name#0 data'
            expect_network_get_success_region 1, region: 'test name#0 data'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: %w[gcompute_address gcompute_region],
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests~gcompute_address~create~noexist~change',
                      'title_eq_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_address, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:gcompute_address,
                                       'title0')
          end
          it { is_expected.to have_attributes(address: 'test address#0 data') }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(a_label: 'title0') }

          # TODO(alexstephen): Implement resourceref test.
          # it 'region' do
          #   # Add test code here
          # end
        end

        # Ensure present: resource missing, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure present: resource missing, ignore, has name
      context 'title != name' do
        # Ensure present: resource missing, ignore, has name, pass
        context 'title != name (pass)' do
          before do
            expect_network_get_failed 1, region: 'test name#0 data'
            expect_network_create \
              1,
              {
                'kind' => 'compute#address',
                'address' => 'test address#0 data',
                'description' => 'test description#0 data',
                'name' => 'test name#0 data'
              },
              region: 'test name#0 data'
            expect_network_get_async 1, region: 'test name#0 data'
            expect_network_get_success_region 1, region: 'test name#0 data'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: %w[gcompute_address gcompute_region],
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests~gcompute_address~create~noexist~change',
                      'title_and_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_address, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:gcompute_address,
                                       'title0')
          end
          it { is_expected.to have_attributes(address: 'test address#0 data') }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(a_label: 'test name#0 data') }

          # TODO(alexstephen): Implement resourceref test.
          # it 'region' do
          #   # Add test code here
          # end
        end

        # Ensure present: resource missing, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end
  end

  context 'ensure == absent' do
    context 'resource missing' do
      # Ensure absent: resource missing, ignore, no name
      context 'title == name' do
        # Ensure absent: resource missing, ignore, no name, pass
        context 'title == name (pass)' do
          before do
            expect_network_get_failed 1, name: 'title0',
                                         region: 'test name#0 data'
            expect_network_get_success_region 1, region: 'test name#0 data'
          end

          let(:runner) do
            # Second path runs first - gets dummy gauth cookbook
            # First path guarantees that this cookbook will be loaded
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: %w[gcompute_address gcompute_region],
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests~gcompute_address~delete~noexist~change',
                      'title_eq_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_address, 'title0')
          end

          it { is_expected.to have_attributes(address: 'test address#0 data') }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(a_label: 'title0') }

          # TODO(alexstephen): Implement resourceref test.
          # it 'region' do
          #   # Add test code here
          # end
        end

        # Ensure absent: resource missing, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end

      # Ensure absent: resource missing, ignore, has name
      context 'title != name' do
        # Ensure absent: resource missing, ignore, has name, pass
        context 'title != name (pass)' do
          before do
            expect_network_get_failed 1, region: 'test name#0 data'
            expect_network_get_success_region 1, region: 'test name#0 data'
          end

          let(:runner) do
            # Second path runs first - gets dummy gauth cookbook
            # First path guarantees that this cookbook will be loaded
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: %w[gcompute_address gcompute_region],
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests~gcompute_address~delete~noexist~change',
                      'title_and_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_address, 'title0')
          end

          it { is_expected.to have_attributes(address: 'test address#0 data') }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(a_label: 'test name#0 data') }

          # TODO(alexstephen): Implement resourceref test.
          # it 'region' do
          #   # Add test code here
          # end
        end

        # Ensure absent: resource missing, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end

    context 'resource exists' do
      # Ensure absent: resource exists, ignore, no name
      context 'title == name' do
        # Ensure absent: resource exists, ignore, no name, pass
        context 'title == name (pass)' do
          before do
            expect_network_get_success 1, name: 'title0',
                                          region: 'test name#0 data'
            expect_network_delete 1, 'title0', region: 'test name#0 data'
            expect_network_get_async 1, name: 'title0',
                                        region: 'test name#0 data'
            expect_network_get_success_region 1, region: 'test name#0 data'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: %w[gcompute_address gcompute_region],
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests~gcompute_address~delete~exist~change',
                      'title_eq_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_address, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:gcompute_address,
                                       'title0')
          end
          it { is_expected.to have_attributes(address: 'test address#0 data') }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(a_label: 'title0') }

          # TODO(alexstephen): Implement resourceref test.
          # it 'region' do
          #   # Add test code here
          # end
        end

        # Ensure absent: resource exists, ignore, no name, fail
        context 'title == name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
      # Ensure absent: resource exists, ignore, has name
      context 'title != name' do
        # Ensure absent: resource exists, ignore, has name, pass
        context 'title != name (pass)' do
          before do
            expect_network_get_success 1, region: 'test name#0 data'
            expect_network_delete 1, nil, region: 'test name#0 data'
            expect_network_get_async 1, region: 'test name#0 data'
            expect_network_get_success_region 1, region: 'test name#0 data'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: %w[gcompute_address gcompute_region],
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests~gcompute_address~delete~exist~change',
                      'title_and_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_address, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:gcompute_address,
                                       'title0')
          end
          it { is_expected.to have_attributes(address: 'test address#0 data') }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(a_label: 'test name#0 data') }

          # TODO(alexstephen): Implement resourceref test.
          # it 'region' do
          #   # Add test code here
          # end
        end

        # Ensure absent: resource exists, ignore, has name, fail
        context 'title != name (fail)' do
          # TODO(alexstephen): Implement new test format.
          subject { -> { raise '[placeholder] This should fail.' } }
          it { is_expected.to raise_error(RuntimeError, /placeholder/) }
        end
      end
    end
  end

  def expand_variables(template, data, extra_data = {})
    Google::GCOMPUTE::Address
      .action_class.expand_variables(template, data, extra_data)
  end

  def expect_network_get_success(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result("success#{id}~#{id_data}.yaml").to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Compute::Network::Get).to receive(:new)
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

  def expect_network_get_async(id, data = {})
    body = { kind: 'compute#address' }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug ">> GET <async> #{args}"
      request
    end
  end

  def expect_network_get_failed(id, data = {})
    request = double('request')
    allow(request).to receive(:send).and_return(http_failed_object_missing)

    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug ">> GET [failed] #{args}"
      request
    end
  end

  def http_failed_object_missing
    Net::HTTPNotFound.new(1.0, 404, 'Not Found')
  end

  def expect_network_create(id, expected_body, data = {})
    body = { kind: 'compute#operation',
             status: 'DONE',
             targetLink: self_link(uri_data(id).merge(data)) }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Compute::Network::Post).to receive(:new)
      .with(collection(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization),
            'application/json', expected_body.to_json) do |args|
      debug ">> POST #{args} = body(#{body})"
      request
    end
  end

  def expect_network_delete(id, name = nil, data = {})
    delete_data = uri_data(id).merge(data)
    delete_data[:name] = name unless name.nil?
    body = { kind: 'compute#operation',
             status: 'DONE',
             targetLink: self_link(delete_data) }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Compute::Network::Delete).to receive(:new)
      .with(self_link(delete_data),
            instance_of(Google::FakeAuthorization)) do |args|
      debug ">> DELETE #{args}"
      request
    end
  end

  def load_network_result(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_address', file)
    debug("Loading result file: #{results}")
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def expect_network_get_success_region(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result_region("success#{id}~" \
                                                           "#{id_data}.yaml")
           .to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link_region(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug ">> GET #{args}"
      request
    end
  end

  def load_network_result_region(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_region', file)
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def self_link_region(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables_region(
        'projects/{{project}}/regions/{{name}}',
        data
      )
    )
  end

  def debug(message)
    puts(message) if ENV['RSPEC_DEBUG']
  end

  def expand_variables_region(template, data, ext_dat = {})
    Google::GCOMPUTE::Region
      .action_class.expand_variables(template, data, ext_dat)
  end

  def collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/regions/{{region}}/addresses',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/regions/{{region}}/addresses/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: A_PROJECT_DATA[(id - 1) % A_PROJECT_DATA.size],
      region: A_REGION_DATA[(id - 1) % A_REGION_DATA.size],
      name: A_NAME_DATA[(id - 1) % A_NAME_DATA.size]
    }
  end
end
