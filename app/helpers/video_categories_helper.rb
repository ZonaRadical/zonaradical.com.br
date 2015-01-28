module VideoCategoriesHelper

  def menu_video_categories(video_categories)
    video_categories.map do |video_categories, sub_video_categories|
      if sub_video_categories.empty?
        content_tag(:li, link_to(video_categories.name, main_app.video_categories_path(video_categories.id)))
      else
        content_tag(:li, link_to(video_categories.name, main_app.video_categories_path(video_categories.id)) + content_tag(:ul, sub_menu_video_categories(sub_video_categories),:class => 'subsubmenu'),:class => 'subsubmenu-item' )
      end

    end.join.html_safe
  end

end


