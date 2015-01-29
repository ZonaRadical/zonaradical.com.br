module VideoCategoriesHelper

  def menu_video_categories(video_categories)
    video_categories.map do |video_categories, sub_video_categories|
      content_tag(:li, link_to("VIDEOS", "../videos"))
     # if sub_video_categories.empty?
     #   content_tag(:li, link_to(video_categories.name, "../videos"))
     # else
     #   content_tag(:li, link_to(video_categories.name, "../videos") + content_tag(:ul, sub_menu_video_categories(sub_video_categories),:class => 'subsubmenu'),:class => 'subsubmenu-item' )
     # end

    end.join.html_safe
  end
  def sub_menu_video_categories(video_categories)
    video_categories.map do |video_categories, sub_video_category|
      content_tag(:li,link_to(video_categories.name, "../videos"))
    end.join.html_safe
  end
end


