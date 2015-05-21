# @todo Перенсти это все в один хэлпер для категорий
module TipCategoriesHelper
  def nested_tip_categories(tip_categories)
    tip_categories.map do |tip_category, sub_tip_category|
      render(tip_category) + content_tag(:ul, nested_tip_categories(sub_tip_category), :class=> 'sub_tip_category')
    end.join.html_safe
  end

  def menu_tip_categories(tip_categories)
    tip_categories.map do |tip_category, sub_tip_category|
      if sub_tip_category.empty?
        content_tag(:li, link_to(tip_category.name, show_tip_category_path(tip_category)))
      else
        content_tag(:li, link_to(tip_category.name, show_tip_category_path(tip_category)) + content_tag(:ul, sub_menu_tip_categories(sub_tip_category),:class => 'subsubmenu'),:class => 'subsubmenu-item' )
      end
    end.join.html_safe
  end

  def sub_menu_tip_categories(tip_categories)
    tip_categories.map do |tip_category, sub_tip_category|
      content_tag(:li,link_to(tip_category.name, show_tip_category_path(tip_category)))
    end.join.html_safe
  end

end


