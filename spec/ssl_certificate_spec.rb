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
context 'gcompute_ssl_certificate' do
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
              expect_network_get_success 1, name: 'title0'
              expect_network_get_success 2, name: 'title1'
              expect_network_get_success 3, name: 'title2'
            end

            let(:runner) do
              cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                                File.join(File.dirname(__FILE__), 'cookbooks')]
              ChefSpec::SoloRunner.new(
                step_into: 'gcompute_ssl_certificate',
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              apply_recipe(
                <<-MANIFEST
                  gcompute_ssl_certificate 'title0' do
                    action :create
                    certificate 'test certificate#0 data'
                    description 'test description#0 data'
                    private_key 'test private_key#0 data'
                    project 'test project#0 data'
                    credential 'mycred'
                  end

                  gcompute_ssl_certificate 'title1' do
                    action :create
                    certificate 'test certificate#1 data'
                    description 'test description#1 data'
                    private_key 'test private_key#1 data'
                    project 'test project#1 data'
                    credential 'mycred'
                  end

                  gcompute_ssl_certificate 'title2' do
                    action :create
                    certificate 'test certificate#2 data'
                    description 'test description#2 data'
                    private_key 'test private_key#2 data'
                    project 'test project#2 data'
                    credential 'mycred'
                  end
                MANIFEST
              ) do |recipe_name|
                runner.converge(recipe_name) do
                  cred = Google::CredentialResourceMock.new('mycred',
                                                            runner.run_context)
                  runner.resource_collection.insert(cred)
                end
              end
            end

            context 'gcompute_ssl_certificate[title0]' do
              subject do
                chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
              end

              it do
                is_expected
                  .to have_attributes(certificate: 'test certificate#0 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#0 data')
              end

              it { is_expected.to have_attributes(sc_label: 'title0') }

              it do
                is_expected
                  .to have_attributes(private_key: 'test private_key#0 data')
              end
            end

            context 'gcompute_ssl_certificate[title1]' do
              subject do
                chef_run.find_resource(:gcompute_ssl_certificate, 'title1')
              end

              it do
                is_expected
                  .to have_attributes(certificate: 'test certificate#1 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#1 data')
              end

              it { is_expected.to have_attributes(sc_label: 'title1') }

              it do
                is_expected
                  .to have_attributes(private_key: 'test private_key#1 data')
              end
            end

            context 'gcompute_ssl_certificate[title2]' do
              subject do
                chef_run.find_resource(:gcompute_ssl_certificate, 'title2')
              end

              it do
                is_expected
                  .to have_attributes(certificate: 'test certificate#2 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#2 data')
              end

              it { is_expected.to have_attributes(sc_label: 'title2') }

              it do
                is_expected
                  .to have_attributes(private_key: 'test private_key#2 data')
              end
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
              expect_network_get_success 1
              expect_network_get_success 2
              expect_network_get_success 3
            end

            let(:runner) do
              cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                                File.join(File.dirname(__FILE__), 'cookbooks')]
              ChefSpec::SoloRunner.new(
                step_into: 'gcompute_ssl_certificate',
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              apply_recipe(
                <<-MANIFEST
                  gcompute_ssl_certificate 'title0' do
                    action :create
                    certificate 'test certificate#0 data'
                    description 'test description#0 data'
                    private_key 'test private_key#0 data'
                    sc_label 'test name#0 data'
                    project 'test project#0 data'
                    credential 'mycred'
                  end

                  gcompute_ssl_certificate 'title1' do
                    action :create
                    certificate 'test certificate#1 data'
                    description 'test description#1 data'
                    private_key 'test private_key#1 data'
                    sc_label 'test name#1 data'
                    project 'test project#1 data'
                    credential 'mycred'
                  end

                  gcompute_ssl_certificate 'title2' do
                    action :create
                    certificate 'test certificate#2 data'
                    description 'test description#2 data'
                    private_key 'test private_key#2 data'
                    sc_label 'test name#2 data'
                    project 'test project#2 data'
                    credential 'mycred'
                  end
                MANIFEST
              ) do |recipe_name|
                runner.converge(recipe_name) do
                  cred = Google::CredentialResourceMock.new('mycred',
                                                            runner.run_context)
                  runner.resource_collection.insert(cred)
                end
              end
            end

            context 'gcompute_ssl_certificate[title0]' do
              subject do
                chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
              end

              it do
                is_expected
                  .to have_attributes(certificate: 'test certificate#0 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#0 data')
              end

              it do
                is_expected.to have_attributes(sc_label: 'test name#0 data')
              end

              it do
                is_expected
                  .to have_attributes(private_key: 'test private_key#0 data')
              end
            end

            context 'gcompute_ssl_certificate[title1]' do
              subject do
                chef_run.find_resource(:gcompute_ssl_certificate, 'title1')
              end

              it do
                is_expected
                  .to have_attributes(certificate: 'test certificate#1 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#1 data')
              end

              it do
                is_expected.to have_attributes(sc_label: 'test name#1 data')
              end

              it do
                is_expected
                  .to have_attributes(private_key: 'test private_key#1 data')
              end
            end

            context 'gcompute_ssl_certificate[title2]' do
              subject do
                chef_run.find_resource(:gcompute_ssl_certificate, 'title2')
              end

              it do
                is_expected
                  .to have_attributes(certificate: 'test certificate#2 data')
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#2 data')
              end

              it do
                is_expected.to have_attributes(sc_label: 'test name#2 data')
              end

              it do
                is_expected
                  .to have_attributes(private_key: 'test private_key#2 data')
              end
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
            expect_network_get_failed 1, name: 'title0'
            expect_network_create \
              1,
              {
                'kind' => 'compute#sslCertificate',
                'certificate' => 'test certificate#0 data',
                'description' => 'test description#0 data',
                'name' => 'title0',
                'privateKey' => 'test private_key#0 data'
              },
              name: 'title0'
            expect_network_get_async 1, name: 'title0'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_ssl_certificate',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                gcompute_ssl_certificate 'title0' do
                  action :create
                  certificate 'test certificate#0 data'
                  description 'test description#0 data'
                  private_key 'test private_key#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:gcompute_ssl_certificate,
                                       'title0')
          end
          it do
            is_expected
              .to have_attributes(certificate: 'test certificate#0 data')
          end

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(sc_label: 'title0') }

          it do
            is_expected
              .to have_attributes(private_key: 'test private_key#0 data')
          end
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
            expect_network_get_failed 1
            expect_network_create \
              1,
              'kind' => 'compute#sslCertificate',
              'certificate' => 'test certificate#0 data',
              'description' => 'test description#0 data',
              'name' => 'test name#0 data',
              'privateKey' => 'test private_key#0 data'
            expect_network_get_async 1
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_ssl_certificate',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                gcompute_ssl_certificate 'title0' do
                  action :create
                  certificate 'test certificate#0 data'
                  description 'test description#0 data'
                  private_key 'test private_key#0 data'
                  sc_label 'test name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:gcompute_ssl_certificate,
                                       'title0')
          end
          it do
            is_expected
              .to have_attributes(certificate: 'test certificate#0 data')
          end

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(sc_label: 'test name#0 data') }

          it do
            is_expected
              .to have_attributes(private_key: 'test private_key#0 data')
          end
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
            expect_network_get_failed 1, name: 'title0'
          end

          let(:runner) do
            # Second path runs first - gets dummy gauth cookbook
            # First path guarantees that this cookbook will be loaded
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_ssl_certificate',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                gcompute_ssl_certificate 'title0' do
                  action :delete
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
          end
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
            expect_network_get_failed 1
          end

          let(:runner) do
            # Second path runs first - gets dummy gauth cookbook
            # First path guarantees that this cookbook will be loaded
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_ssl_certificate',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                gcompute_ssl_certificate 'title0' do
                  action :delete
                  sc_label 'test name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
          end
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
            expect_network_get_success 1, name: 'title0'
            expect_network_delete 1, 'title0'
            expect_network_get_async 1, name: 'title0'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_ssl_certificate',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                gcompute_ssl_certificate 'title0' do
                  action :delete
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:gcompute_ssl_certificate,
                                       'title0')
          end
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
            expect_network_get_success 1
            expect_network_delete 1
            expect_network_get_async 1
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_ssl_certificate',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            apply_recipe(
              <<-MANIFEST
                gcompute_ssl_certificate 'title0' do
                  action :delete
                  sc_label 'test name#0 data'
                  project 'test project#0 data'
                  credential 'mycred'
                end
              MANIFEST
            ) do |recipe_name|
              runner.converge(recipe_name) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end
          end

          subject do
            chef_run.find_resource(:gcompute_ssl_certificate, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:gcompute_ssl_certificate,
                                       'title0')
          end
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
    Google::GCOMPUTE::SslCertificate
      .action_class.expand_variables(template, data, extra_data)
  end

  def expect_network_get_success(id, data = {})
    id_data = data.fetch(:name, '').include?('title') ? 'title' : 'name'
    body = load_network_result("success#{id}~#{id_data}.yaml").to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! GET #{self_link(uri_data(id).merge(data))}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET #{args}"
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
    body = { kind: 'compute#sslCertificate' }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! #{self_link(uri_data(id).merge(data))}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET <async> #{args}"
      request
    end
  end

  def expect_network_get_failed(id, data = {})
    request = double('request')
    allow(request).to receive(:send).and_return(http_failed_object_missing)

    debug_network "!! #{self_link(uri_data(id).merge(data))}"
    expect(Google::Compute::Network::Get).to receive(:new)
      .with(self_link(uri_data(id).merge(data)),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> GET [failed] #{args}"
      request
    end
  end

  def http_failed_object_missing
    Net::HTTPNotFound.new(1.0, 404, 'Not Found')
  end

  def expect_network_create(id, expected_body, data = {})
    merged_uri = uri_data(id).merge(data)
    body = { kind: 'compute#operation',
             status: 'DONE', targetLink: self_link(merged_uri) }.to_json

    request = double('request')
    allow(request).to receive(:send).and_return(http_success(body))

    debug_network "!! POST #{collection(merged_uri)}"
    expect(Google::Compute::Network::Post).to receive(:new)
      .with(collection(merged_uri), instance_of(Google::FakeAuthorization),
            'application/json', expected_body.to_json) do |args|
      debug_network ">> POST #{args} = body(#{body})"
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

    debug_network "!! DELETE #{self_link(delete_data)}"
    expect(Google::Compute::Network::Delete).to receive(:new)
      .with(self_link(delete_data),
            instance_of(Google::FakeAuthorization)) do |args|
      debug_network ">> DELETE #{args}"
      request
    end
  end

  def load_network_result(file)
    results = File.join(File.dirname(__FILE__), 'data', 'network',
                        'gcompute_ssl_certificate', file)
    debug("Loading result file: #{results}")
    raise "Network result data file #{results}" unless File.exist?(results)
    data = YAML.safe_load(File.read(results))
    raise "Invalid network results #{results}" unless data.class <= Hash
    data
  end

  def debug(message)
    puts(message) if ENV['RSPEC_DEBUG']
  end

  def debug_network(message)
    puts("Network #{message}") \
      if ENV['RSPEC_DEBUG'] || ENV['RSPEC_HTTP_VERBOSE']
  end

  def collection(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/sslCertificates',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/sslCertificates/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: GoogleTests::Constants::SC_PROJECT_DATA[(id - 1) \
        % GoogleTests::Constants::SC_PROJECT_DATA.size],
      name: GoogleTests::Constants::SC_NAME_DATA[(id - 1) \
        % GoogleTests::Constants::SC_NAME_DATA.size]
    }
  end

  def build_cred
    <<-CRED
    gauth_credential 'mycred' do
      action :serviceaccount
      path '/home'
      scopes [
        'test_path'
      ]
    end
    CRED
  end

  # Creates a test recipe file and runs a block before destroying the file
  def apply_recipe(recipe)
    # Creates a random string name
    recipe_name = "recipe~test~#{(0...8).map { (65 + rand(26)).chr }.join}"
    recipe_loc = File.join(File.dirname(__FILE__), '..', 'recipes',
                           "#{recipe_name}.rb")

    File.open(recipe_loc, 'w') do |file|
      file.write([build_cred, recipe].join("\n"))
    end
    recipe_path = "gcompute::#{recipe_name}"
    begin
      yield recipe_path
    ensure
      File.delete(recipe_loc)
    end
  end
end
