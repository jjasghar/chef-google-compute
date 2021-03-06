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

# Enable loading cookbook libraries
search_self = File.expand_path('../../..', __dir__)
$LOAD_PATH.unshift search_self unless $LOAD_PATH.include?(search_self)

require 'google/compute/network/get'
require 'resources/address'

# Retrieves the IP address associated with a gcompute_address static IP.
#
# Arguments:
#   - name: string
#     the name of the static IP
#   - region: string
#     the name of the region that hosts the address
#   - project: string
#     the name of the project that hosts the address
#   - cred: authorization
#     the credential to use to authorize the information request
#
# Examples:
#   - gcompute_address_ip('my-server', 'us-central1', 'myproject', fn_auth)
#
# The credential parameter should be allocated with a
# `gauth_credential_*_for_function` call.
module Google
  # Module that holds all client-side functions
  module Functions
    def self.gcompute_address_ip(name, region, project, cred)
      uri = Google::GCOMPUTE::Address.action_class.self_link(name: name,
                                                             region: region,
                                                             project: project)
      get_request = ::Google::Compute::Network::Get.new(uri, cred)
      response = JSON.parse(get_request.send.body)
      response['address']
    end

    def gcompute_address_ip(name, region, project, cred)
      ::Google::Functions.gcompute_address_ip(name, region, project, cred)
    end
  end
end
