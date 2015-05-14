class Comment
  include ActiveModel::Model
  
  attr_accessor :content

  def save(tour, user)
    create_topic(tour, user.surname) if tour.discourse_topic_id.nil?
  end

  private

  def create_topic(tour, api_username)
    client = DiscourseZr.client
    client.api_username = api_username
    topic = client.create_topic(
      title: tour.title,
      raw: content,
      category: tour.resort_categories.first.name.downcase,
      skip_validations: true
    )
    tour.update_attribute(:discourse_topic_id, topic['id'])
  end
end