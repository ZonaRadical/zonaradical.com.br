require 'discourse_zr/act_as_discoursable'

module DiscourseZr
  def self.client(options = {})
    options[:username] ||= Rails.application.secrets.discourse_api_username
    DiscourseApi::Client.new(
      Rails.application.secrets.discourse_url,
      Rails.application.secrets.discourse_api_key,
      options[:username]
    )
  end
end