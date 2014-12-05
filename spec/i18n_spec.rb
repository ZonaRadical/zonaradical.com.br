# spec/i18n_spec.rb:
require 'spec_helper'
require 'i18n/tasks'

describe 'I18n', broken: true  do
  let(:i18n) { I18n::Tasks::BaseTask.new }

  it 'have missing keys' do
    count = i18n.missing_keys.count
    fail "There are #{count} missing i18n keys! Run 'i18n-tasks missing' for more details." unless count.zero?
  end

  it 'have unused keys' do
    count = i18n.unused_keys.count
    fail "There are #{count} unused i18n keys! Run 'i18n-tasks unused' for more details." unless count.zero?
  end
end