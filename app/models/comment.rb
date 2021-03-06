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
  rescue DiscourseApi::Error => e
    parse_discourse_error(e.message)
  rescue
    unknow_error
  end

  private

  def parse_discourse_error(message)
    begin
      discourse_errors = JSON.parse(message.gsub('=>',':'))['errors']
      discourse_errors.each { |error| errors.add(:content, error.gsub(/^Body/, '')) }
      false
    rescue
      unknow_error
    end
  end

  def unknow_error
    errors.add(:base, 'Ocorreu um erro desconhecido, por favor tente novamente. Se o problema persistir, contate o administrador do sistema.')
    false
  end
end