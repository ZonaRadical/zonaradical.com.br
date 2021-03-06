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

  def self.sync_sso(user)
    client = DiscourseZr.client
    client.sync_sso(
      sso_secret: Rails.application.secrets.discourse_secret,
      name: user.name,
      username: user.surname,
      email: user.email,
      external_id: user.id
    )
  end

  def self.topic_url(topic_id)
    client = DiscourseZr.client
    topic = client.topic(topic_id)
    Rails.application.routes.url_helpers.root_url(subdomain: 'forum') + "t/#{topic['slug']}/#{topic_id}"
  end
end