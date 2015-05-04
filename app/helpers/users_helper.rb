module UsersHelper
	def user_last_seen_at(user = @user)
		user.last_seen_at.nil? ? t('never') : distance_of_time_in_words_to_now(user.last_seen_at)
	end

  def avatar_img(user)
    image_tag(user.avatar_url, class: 'userpic', alt: user.name)
  end
end
