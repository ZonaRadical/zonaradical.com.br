module UsersHelper
	def user_last_seen_at(user = @user)
		user.last_seen_at.nil? ? t('never') : distance_of_time_in_words_to_now(user.last_seen_at)
	end

  def can_add_gallery?(user = @user)
    (user == current_user and user.has_role?(:athlete)) or (current_user.has_role?(:admin))
  end

  def image_gallery_button
    btn_classes = ['button']
    btn_classes << 'nona' unless can_add_gallery?(current_user)
    link_to t('imageGalleries'), user_image_galleries_path(@user), class: btn_classes
  end

  def avatar_img(user)
    image_tag(user.avatar_url, class: 'userpic', alt: user.name+" avatar")
  end
  def avatar_img_sm(user)
    image_tag(user.avatar_url, class: 'userpic-sm', alt: user.name+" avatar")
  end
end
