module UsersHelper
	def user_last_seen_at(user = @user)
		user.last_seen_at.nil? ? t('never') : distance_of_time_in_words_to_now(user.last_seen_at)
	end

  def can_add_gallery?(user = @user)
    user == current_user and (user.has_role?(:admin) or user.has_role?(:athlete))
  end
end
