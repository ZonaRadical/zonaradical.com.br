class Comment
  include ActiveModel::Model

  attr_accessor :tour_id
  attr_accessor :user_id
  attr_accessor :content

  def save
    tour = Tour.find(tour_id)
    discourse_user = DiscourseZr.client.user_by_external_id(user_id)
    discourse_user = DiscourseZr.sync_sso(User.find(user_id)) if discourse_user.nil?
    client = DiscourseZr.client(username: discourse_user['username'])
    client.create_post(topic_id: tour.discourse_topic_id, raw: content)
  end
end