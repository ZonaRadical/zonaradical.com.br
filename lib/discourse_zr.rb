class DiscourseZr
  def self.client
    DiscourseApi::Client.new(
      Rails.application.secrets.discourse_url,
      Rails.application.secrets.discourse_api_key,
      Rails.application.secrets.discourse_api_username
    )
  end
end