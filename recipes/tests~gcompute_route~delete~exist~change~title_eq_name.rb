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

gcompute_network 'resource(network,0)' do
  action :create
  project 'test project#0 data'
  credential 'mycred'
  description 'test description#0 data'
  gateway_ipv4 'test gateway_ipv4#0 data'
  ipv4_range 'test ipv4_range#0 data'
  n_label 'test name#0 data'
  auto_create_subnetworks true
end

gcompute_route 'title0' do
  action :delete
  project 'test project#0 data'
  credential 'mycred'
  dest_range 'test dest_range#0 data'
  network 'resource(network,0)'
  priority 1_108_918_677
  tags %w[mm nn oo pp]
  next_hop_gateway 'test next_hop_gateway#0 data'
  next_hop_instance 'test next_hop_instance#0 data'
  next_hop_ip 'test next_hop_ip#0 data'
  next_hop_vpn_tunnel 'test next_hop_vpn_tunnel#0 data'
end
