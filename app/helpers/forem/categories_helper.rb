module Forem
  module CategoriesHelper
    def menu_forem_categories(forem_categories)
      forem_categories.collect do |forem_category|
        content_tag(:li, link_to(forem_category.name, forem.category_path(forem_category)))
      end.join.html_safe
    end
  end
end