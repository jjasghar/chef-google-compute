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

require 'net/http'
require 'net/https'

module Google
  module Compute
    module Network
      # A handler for authenticated network request
      class Base
        def initialize(link, cred)
          @link = link
          @cred = cred
        end

        def builder
          Net::HTTP.const_get(self.class.name.split('::').last)
        end

        def send
          request = @cred.authorize(builder.new(@link))
          request['User-Agent'] = generate_user_agent
          transport(request).request(request)
        end

        def transport(request)
          uri = request.uri
          puts "network(#{request}: #{uri})" \
            unless ENV['GOOGLE_HTTP_VERBOSE'].nil?
          transport = Net::HTTP.new(uri.host, uri.port)
          transport.use_ssl = uri.is_a?(URI::HTTPS)
          transport.verify_mode = OpenSSL::SSL::VERIFY_PEER
          transport.set_debug_output $stderr \
            unless ENV['GOOGLE_HTTP_DEBUG'].nil?
          transport
        end

        private

        def generate_user_agent
          # TODO(alexstephen): Check how to get the original Chef user agent.
          # TODO(alexstephen): Check how to fetch cookbook version.
          version = '1.0.0'
          [
            "GoogleChefCompute/#{version}"
          ].join(' ')
        end
      end
    end
  end
end
