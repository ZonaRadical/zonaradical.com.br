include Warden::Test::Helpers

module FeaturesHelper
  def login(user, options = {})
    options[:password] ||= 'foobar'
    options[:login_url] ||= root_path
    visit options[:login_url]
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: options[:password]
    click_button 'Sign in'
  end
end

RSpec.configure do |config|
  config.include FeaturesHelper, type: :feature
end
