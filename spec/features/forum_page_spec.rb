require 'rails_helper'

feature 'Forum page' do
  before :each do
    create(:video_category, name: 'Digiácomo Dias')
  end

  context 'undefined method' do
    scenario 'URL helper without main_app' do
      module VideoCategoriesHelper
        def menu_video_categories(video_categories)
          video_categories.map do |video_category, sub_video_categories|
            if sub_video_categories.empty?
              content_tag(:li, link_to(video_category.name, video_category_path(video_category)))
            else
              content_tag(:li, link_to(video_category.name, video_category_path(video_category)) + content_tag(:ul, sub_menu_video_categories(sub_video_categories),:class => 'subsubmenu'),:class => 'subsubmenu-item')
            end
          end.join.html_safe
        end
      end

      expect do
        visit root_path
        within 'ul.menu' do
          click_link 'Forum'
        end
      end.to raise_error(ActionView::Template::Error, /undefined method/)
    end
  end

  context 'successful access' do
    scenario 'URL helper with main_app' do
      module VideoCategoriesHelper
        def menu_video_categories(video_categories)
          video_categories.map do |video_category, sub_video_categories|
            if sub_video_categories.empty?
              content_tag(:li, link_to(video_category.name, main_app.video_category_path(video_category)))
            else
              content_tag(:li, link_to(video_category.name, main_app.video_category_path(video_category)) + content_tag(:ul, sub_menu_video_categories(sub_video_categories),:class => 'subsubmenu'),:class => 'subsubmenu-item')
            end
          end.join.html_safe
        end
      end

      expect do
        create(:video_category, name: 'Digiácomo Dias')
        
        visit root_path
        within 'ul.menu' do
          click_link 'Forum'
        end
      end.not_to raise_error
    end
  end
end