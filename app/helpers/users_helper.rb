module UsersHelper
	def user_last_seen_at(user = @user)
		user.last_seen_at.nil? ? t('never') : distance_of_time_in_words_to_now(user.last_seen_at)
	end

  def can_add_gallery?(user = @user)
    if user
      (user == current_user and user.has_role?(:athlete)) or (current_user.has_role?(:admin))
    end
  end

  def image_gallery_button
    btn_classes = ['button']
    btn_classes << 'nona' unless can_add_gallery?(current_user)
    link_to t('imageGalleries'), user_image_galleries_path(@user), class: btn_classes
  end

  def avatar_img(user)
    image_tag(user.avatar_url(:ava), class: 'userpic', alt: user.name.to_s)
  end
  def logo_img(user)
    image_tag(user.avatar_url(:thumb), class: 'resortlogo', alt: user.name.to_s)
  end

  def avatar_img_sm(user)
    image_tag(user.avatar_url(:ava), class: 'userpic-sm', alt: user.name.to_s+" avatar")
  end

  def tour_button(user = @user)
    if can? :manage, Tour and current_user == user
      link_to t('tours'), manage_tours_path, class: 'button'
    else
      link_to t('tours'), user_tours_path(user), class: 'button'
    end
  end

  def offer_button(user = @user)
    if can? :manage, Offer and current_user == user
      link_to t('offers'), manage_offers_path, class: 'button'
    else
      link_to t('offers'), user_offers_path(user), class: 'button'
    end
  end

  def offers_published(user)
    total_offers = Offer.published.owned_by([user]).count
    link_to total_offers, user_offers_path(user)
  end
end
