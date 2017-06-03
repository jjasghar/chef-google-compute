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

require 'spec_helper'

context 'check examples with foodcritic' do
  let(:recipes) do
    Dir[File.join(File.dirname(__FILE__), '../', 'recipes', '*.rb')]
  end

  let(:command) { ['foodcritic'].concat(recipes) }

  subject { Bundle.run(command) }

  it { is_expected.to be_zero }
end

context 'ensure foodcritic recognizes bad recipes' do
  let(:poor_recipe) do
    File.join(File.dirname(__FILE__), 'data', 'poor_recipe.rb')
  end

  let(:command) { ['foodcritic', poor_recipe] }

  subject { Bundle.run(command) }

  it { is_expected.not_to be_zero }
end
