module CategoriesHelper
  def nested_categories(categories)
    categories.map do |category, sub_category|
      render(category) + content_tag(:ul, nested_categories(sub_category), :class=> 'sub_category')
    end.join.html_safe
  end

  def menu_categories(categories)
    categories.map do |category, sub_category|
      content_tag(:li, link_to(category.name, url_for(category)) + content_tag(:ul, sub_menu_categories(sub_category),:class => 'subsubmenu'),:class => 'subsubmenu-item' )
    end.join.html_safe
  end

  def sub_menu_categories(categories)
    categories.map do |category|
      content_tag(:li,link_to(url_for(category)))
    end.join.html_safe
  end

  def aside_categories(category)
    html = ''
    category.path.from_depth(0).each do |parent|
      html += link_to parent.name, show_tip_category_path(parent), :class => :active
      if parent.depth < category.depth
        html +=content_tag(:span, ' >> ')
      end
    end
    html.html_safe
  end

end


