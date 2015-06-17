module VideoCategoriesHelper

  def menu_video_categories(video_categories)
    video_categories.map do |video_category, sub_video_categories|
      if sub_video_categories.empty?
        content_tag(:li, link_to(video_category.name, show_video_category_path(video_category)))
      else
        content_tag(:li, link_to(video_category.name, "#" ) + content_tag(:ul, sub_menu_video_categories(sub_video_categories),:class => 'subsubmenu'),:class => 'subsubmenu-item')
      end

    end.join.html_safe
  end
  def sub_menu_video_categories(video_categories)
    video_categories.map do |video_category, sub_video_category|
      content_tag(:li,link_to(video_category.name, show_video_category_path(video_category)))
    end.join.html_safe
  end
end


