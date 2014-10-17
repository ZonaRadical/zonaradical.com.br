module ResortCategoriesHelper
  def nested_resort_categories(resort_categories)
    resort_categories.map do |resort_category, sub_resort_category|
      render(resort_category) + content_tag(:ul, nested_resort_categories(sub_resort_category), :class=> 'sub_resort_category')
    end.join.html_safe
  end

  def menu_resort_categories(resort_categories)
    resort_categories.map do |resort_category, sub_resort_category|
      content_tag(:li, link_to(resort_category.name, main_app.resort_category_path(resort_category.id)) + content_tag(:ul, sub_menu_resort_categories(sub_resort_category),:class => 'subsubmenu'),:class => 'subsubmenu-item' )
    end.join.html_safe
  end

  def sub_menu_resort_categories(resort_categories)
    resort_categories.map do |resort_category, sub_resort_category|
      content_tag(:li,link_to(resort_category.name, main_app.resort_category_path(resort_category.id)))
    end.join.html_safe
  end

  def aside_resort_categories(resort_category)
    html = ''
    resort_category.path.from_depth(0).each do |parent|
      html += link_to parent.name, resort_category_path(parent), :class => :active
      if parent.depth < resort_category.depth
        html +=content_tag(:span, ' >> ')
      end
    end
    html.html_safe
  end

end


