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

name 'gcompute'
maintainer 'Google'
maintainer_email 'nelsona@google.com'
license 'apachev2'
description 'A Chef cookbook to manage Google Cloud Compute resources'
long_description '
    This cookbook provides the built-in types and services for Chef to manage
    Google Cloud Compute resources, as native Chef types.'
version '0.1.0'
depends 'google-gauth', '< 0.2.0'
issues_url 'https://github.com/googlecloudplatform/chef-google-compute/issues' \
  if respond_to?(:issues_url)
source_url 'https://github.com/googlecloudplatform/chef-google-compute' \
  if respond_to?(:source_url)
