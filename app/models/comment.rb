class Comment
  include ActiveModel::Model

  attr_accessor :tour_id
  attr_accessor :surname  
  attr_accessor :content

  def save
    tour = Tour.find(tour_id)
    client = DiscourseZr.client
    client.api_username = surname
    client.create_post(topic_id: tour.discourse_topic_id, raw: content)
  end
end