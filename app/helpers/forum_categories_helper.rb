module ForumCategoriesHelper

  def menu_forum_categories(forum_categories)
    forum_categories.map do |forum_categories, sub_forum_categories|
      content_tag(:li, link_to(forum_categories.name, "../videos"))
    end.join.html_safe
  end
end


