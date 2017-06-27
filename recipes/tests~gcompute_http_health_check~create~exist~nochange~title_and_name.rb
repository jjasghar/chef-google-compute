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

gauth_credential 'mycred' do
  action :serviceaccount
  path '/home/nelsonjr/my_account.json'
  scopes [
    'https://www.googleapis.com/auth/ndev.clouddns.readwrite'
  ]
end

gcompute_http_health_check 'title0' do
  action :create
  project 'test project#0 data'
  credential 'mycred'
  check_interval_sec 242_040_324
  description 'test description#0 data'
  healthy_threshold 295_703_256
  host 'test host#0 data'
  port 759_512_136
  request_path 'test request_path#0 data'
  timeout_sec 2_704_031_721
  unhealthy_threshold 1_604_513_019
  hhc_label 'test name#0 data'
end

gcompute_http_health_check 'title1' do
  action :create
  project 'test project#1 data'
  credential 'mycred'
  check_interval_sec 484_080_649
  description 'test description#1 data'
  healthy_threshold 591_406_512
  host 'test host#1 data'
  port 1_519_024_273
  request_path 'test request_path#1 data'
  timeout_sec 5_408_063_442
  unhealthy_threshold 3_209_026_038
  hhc_label 'test name#1 data'
end

gcompute_http_health_check 'title2' do
  action :create
  project 'test project#2 data'
  credential 'mycred'
  check_interval_sec 726_120_974
  description 'test description#2 data'
  healthy_threshold 887_109_769
  host 'test host#2 data'
  port 2_278_536_410
  request_path 'test request_path#2 data'
  timeout_sec 8_112_095_164
  unhealthy_threshold 4_813_539_057
  hhc_label 'test name#2 data'
end
