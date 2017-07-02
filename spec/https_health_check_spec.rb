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
context 'gcompute_https_health_check' do
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
                step_into: 'gcompute_https_health_check',
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              recipe = ['gcompute::tests', 'gcompute_https_health_check',
                        'create', 'exist', 'nochange',
                        'title_eq_name'].join('~')
              runner.converge(recipe) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end

            context 'gcompute_https_health_check[title0]' do
              subject do
                chef_run.find_resource(:gcompute_https_health_check, 'title0')
              end

              it do
                is_expected.to have_attributes(check_interval_sec: 242_040_324)
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#0 data')
              end

              it do
                is_expected.to have_attributes(healthy_threshold: 295_703_256)
              end

              it { is_expected.to have_attributes(host: 'test host#0 data') }

              it { is_expected.to have_attributes(hhc_label: 'title0') }

              it { is_expected.to have_attributes(port: 759_512_136) }

              it do
                is_expected
                  .to have_attributes(request_path: 'test request_path#0 data')
              end

              it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

              it do
                is_expected
                  .to have_attributes(unhealthy_threshold: 1_604_513_019)
              end
            end

            context 'gcompute_https_health_check[title1]' do
              subject do
                chef_run.find_resource(:gcompute_https_health_check, 'title1')
              end

              it do
                is_expected.to have_attributes(check_interval_sec: 484_080_649)
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#1 data')
              end

              it do
                is_expected.to have_attributes(healthy_threshold: 591_406_512)
              end

              it { is_expected.to have_attributes(host: 'test host#1 data') }

              it { is_expected.to have_attributes(hhc_label: 'title1') }

              it { is_expected.to have_attributes(port: 1_519_024_273) }

              it do
                is_expected
                  .to have_attributes(request_path: 'test request_path#1 data')
              end

              it { is_expected.to have_attributes(timeout_sec: 5_408_063_442) }

              it do
                is_expected
                  .to have_attributes(unhealthy_threshold: 3_209_026_038)
              end
            end

            context 'gcompute_https_health_check[title2]' do
              subject do
                chef_run.find_resource(:gcompute_https_health_check, 'title2')
              end

              it do
                is_expected.to have_attributes(check_interval_sec: 726_120_974)
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#2 data')
              end

              it do
                is_expected.to have_attributes(healthy_threshold: 887_109_769)
              end

              it { is_expected.to have_attributes(host: 'test host#2 data') }

              it { is_expected.to have_attributes(hhc_label: 'title2') }

              it { is_expected.to have_attributes(port: 2_278_536_410) }

              it do
                is_expected
                  .to have_attributes(request_path: 'test request_path#2 data')
              end

              it { is_expected.to have_attributes(timeout_sec: 8_112_095_164) }

              it do
                is_expected
                  .to have_attributes(unhealthy_threshold: 4_813_539_057)
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
                step_into: 'gcompute_https_health_check',
                cookbook_path: cookbook_paths,
                platform: 'ubuntu',
                version: '16.04'
              )
            end

            let(:chef_run) do
              recipe = ['gcompute::tests', 'gcompute_https_health_check',
                        'create', 'exist', 'nochange',
                        'title_and_name'].join('~')
              runner.converge(recipe) do
                cred = Google::CredentialResourceMock.new('mycred',
                                                          runner.run_context)
                runner.resource_collection.insert(cred)
              end
            end

            context 'gcompute_https_health_check[title0]' do
              subject do
                chef_run.find_resource(:gcompute_https_health_check, 'title0')
              end

              it do
                is_expected.to have_attributes(check_interval_sec: 242_040_324)
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#0 data')
              end

              it do
                is_expected.to have_attributes(healthy_threshold: 295_703_256)
              end

              it { is_expected.to have_attributes(host: 'test host#0 data') }

              it do
                is_expected.to have_attributes(hhc_label: 'test name#0 data')
              end

              it { is_expected.to have_attributes(port: 759_512_136) }

              it do
                is_expected
                  .to have_attributes(request_path: 'test request_path#0 data')
              end

              it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

              it do
                is_expected
                  .to have_attributes(unhealthy_threshold: 1_604_513_019)
              end
            end

            context 'gcompute_https_health_check[title1]' do
              subject do
                chef_run.find_resource(:gcompute_https_health_check, 'title1')
              end

              it do
                is_expected.to have_attributes(check_interval_sec: 484_080_649)
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#1 data')
              end

              it do
                is_expected.to have_attributes(healthy_threshold: 591_406_512)
              end

              it { is_expected.to have_attributes(host: 'test host#1 data') }

              it do
                is_expected.to have_attributes(hhc_label: 'test name#1 data')
              end

              it { is_expected.to have_attributes(port: 1_519_024_273) }

              it do
                is_expected
                  .to have_attributes(request_path: 'test request_path#1 data')
              end

              it { is_expected.to have_attributes(timeout_sec: 5_408_063_442) }

              it do
                is_expected
                  .to have_attributes(unhealthy_threshold: 3_209_026_038)
              end
            end

            context 'gcompute_https_health_check[title2]' do
              subject do
                chef_run.find_resource(:gcompute_https_health_check, 'title2')
              end

              it do
                is_expected.to have_attributes(check_interval_sec: 726_120_974)
              end

              it do
                is_expected
                  .to have_attributes(description: 'test description#2 data')
              end

              it do
                is_expected.to have_attributes(healthy_threshold: 887_109_769)
              end

              it { is_expected.to have_attributes(host: 'test host#2 data') }

              it do
                is_expected.to have_attributes(hhc_label: 'test name#2 data')
              end

              it { is_expected.to have_attributes(port: 2_278_536_410) }

              it do
                is_expected
                  .to have_attributes(request_path: 'test request_path#2 data')
              end

              it { is_expected.to have_attributes(timeout_sec: 8_112_095_164) }

              it do
                is_expected
                  .to have_attributes(unhealthy_threshold: 4_813_539_057)
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
                'kind' => 'compute#httpsHealthCheck',
                'checkIntervalSec' => 242_040_324,
                'description' => 'test description#0 data',
                'healthyThreshold' => 295_703_256,
                'host' => 'test host#0 data',
                'name' => 'title0',
                'port' => 759_512_136,
                'requestPath' => 'test request_path#0 data',
                'timeoutSec' => 2_704_031_721,
                'unhealthyThreshold' => 1_604_513_019
              },
              name: 'title0'
            expect_network_get_async 1, name: 'title0'
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_https_health_check',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests', 'gcompute_https_health_check',
                      'create', 'noexist', 'change', 'title_eq_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_https_health_check, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:gcompute_https_health_check,
                                       'title0')
          end
          it { is_expected.to have_attributes(check_interval_sec: 242_040_324) }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(healthy_threshold: 295_703_256) }

          it { is_expected.to have_attributes(host: 'test host#0 data') }

          it { is_expected.to have_attributes(hhc_label: 'title0') }

          it { is_expected.to have_attributes(port: 759_512_136) }

          it do
            is_expected
              .to have_attributes(request_path: 'test request_path#0 data')
          end

          it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

          it do
            is_expected.to have_attributes(unhealthy_threshold: 1_604_513_019)
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
              'kind' => 'compute#httpsHealthCheck',
              'checkIntervalSec' => 242_040_324,
              'description' => 'test description#0 data',
              'healthyThreshold' => 295_703_256,
              'host' => 'test host#0 data',
              'name' => 'test name#0 data',
              'port' => 759_512_136,
              'requestPath' => 'test request_path#0 data',
              'timeoutSec' => 2_704_031_721,
              'unhealthyThreshold' => 1_604_513_019
            expect_network_get_async 1
          end

          let(:runner) do
            cookbook_paths = [File.join(File.dirname(__FILE__), '..', '..'),
                              File.join(File.dirname(__FILE__), 'cookbooks')]
            ChefSpec::SoloRunner.new(
              step_into: 'gcompute_https_health_check',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests', 'gcompute_https_health_check',
                      'create', 'noexist', 'change', 'title_and_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_https_health_check, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to create(:gcompute_https_health_check,
                                       'title0')
          end
          it { is_expected.to have_attributes(check_interval_sec: 242_040_324) }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(healthy_threshold: 295_703_256) }

          it { is_expected.to have_attributes(host: 'test host#0 data') }

          it { is_expected.to have_attributes(hhc_label: 'test name#0 data') }

          it { is_expected.to have_attributes(port: 759_512_136) }

          it do
            is_expected
              .to have_attributes(request_path: 'test request_path#0 data')
          end

          it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

          it do
            is_expected.to have_attributes(unhealthy_threshold: 1_604_513_019)
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
              step_into: 'gcompute_https_health_check',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests', 'gcompute_https_health_check',
                      'delete', 'noexist', 'change', 'title_eq_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_https_health_check, 'title0')
          end

          it { is_expected.to have_attributes(check_interval_sec: 242_040_324) }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(healthy_threshold: 295_703_256) }

          it { is_expected.to have_attributes(host: 'test host#0 data') }

          it { is_expected.to have_attributes(hhc_label: 'title0') }

          it { is_expected.to have_attributes(port: 759_512_136) }

          it do
            is_expected
              .to have_attributes(request_path: 'test request_path#0 data')
          end

          it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

          it do
            is_expected.to have_attributes(unhealthy_threshold: 1_604_513_019)
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
              step_into: 'gcompute_https_health_check',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests', 'gcompute_https_health_check',
                      'delete', 'noexist', 'change', 'title_and_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_https_health_check, 'title0')
          end

          it { is_expected.to have_attributes(check_interval_sec: 242_040_324) }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(healthy_threshold: 295_703_256) }

          it { is_expected.to have_attributes(host: 'test host#0 data') }

          it { is_expected.to have_attributes(hhc_label: 'test name#0 data') }

          it { is_expected.to have_attributes(port: 759_512_136) }

          it do
            is_expected
              .to have_attributes(request_path: 'test request_path#0 data')
          end

          it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

          it do
            is_expected.to have_attributes(unhealthy_threshold: 1_604_513_019)
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
              step_into: 'gcompute_https_health_check',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests', 'gcompute_https_health_check',
                      'delete', 'exist', 'change', 'title_eq_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_https_health_check, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:gcompute_https_health_check,
                                       'title0')
          end
          it { is_expected.to have_attributes(check_interval_sec: 242_040_324) }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(healthy_threshold: 295_703_256) }

          it { is_expected.to have_attributes(host: 'test host#0 data') }

          it { is_expected.to have_attributes(hhc_label: 'title0') }

          it { is_expected.to have_attributes(port: 759_512_136) }

          it do
            is_expected
              .to have_attributes(request_path: 'test request_path#0 data')
          end

          it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

          it do
            is_expected.to have_attributes(unhealthy_threshold: 1_604_513_019)
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
              step_into: 'gcompute_https_health_check',
              cookbook_path: cookbook_paths,
              platform: 'ubuntu',
              version: '16.04'
            )
          end

          let(:chef_run) do
            recipe = ['gcompute::tests', 'gcompute_https_health_check',
                      'delete', 'exist', 'change', 'title_and_name'].join('~')
            runner.converge(recipe) do
              cred = Google::CredentialResourceMock.new('mycred',
                                                        runner.run_context)
              runner.resource_collection.insert(cred)
            end
          end

          subject do
            chef_run.find_resource(:gcompute_https_health_check, 'title0')
          end

          it 'should run test correctly' do
            expect(chef_run).to delete(:gcompute_https_health_check,
                                       'title0')
          end
          it { is_expected.to have_attributes(check_interval_sec: 242_040_324) }

          it do
            is_expected
              .to have_attributes(description: 'test description#0 data')
          end

          it { is_expected.to have_attributes(healthy_threshold: 295_703_256) }

          it { is_expected.to have_attributes(host: 'test host#0 data') }

          it { is_expected.to have_attributes(hhc_label: 'test name#0 data') }

          it { is_expected.to have_attributes(port: 759_512_136) }

          it do
            is_expected
              .to have_attributes(request_path: 'test request_path#0 data')
          end

          it { is_expected.to have_attributes(timeout_sec: 2_704_031_721) }

          it do
            is_expected.to have_attributes(unhealthy_threshold: 1_604_513_019)
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
    Google::GCOMPUTE::HttpsHealthCheck
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
    body = { kind: 'compute#httpsHealthCheck' }.to_json

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
                        'gcompute_https_health_check', file)
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
        'projects/{{project}}/global/httpsHealthChecks',
        data
      )
    )
  end

  def self_link(data)
    URI.join(
      'https://www.googleapis.com/compute/v1/',
      expand_variables(
        'projects/{{project}}/global/httpsHealthChecks/{{name}}',
        data
      )
    )
  end

  # Creates variable test data to comply with self_link URI parameters
  def uri_data(id)
    {
      project: GoogleTests::Constants::HHC_PROJECT_DATA[(id - 1) \
        % GoogleTests::Constants::HHC_PROJECT_DATA.size],
      name: GoogleTests::Constants::HHC_NAME_DATA[(id - 1) \
        % GoogleTests::Constants::HHC_NAME_DATA.size]
    }
  end
end
