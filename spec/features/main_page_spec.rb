require 'rails_helper'

feature 'main page' do
  context 'main menu' do
    scenario 'dynamic display video categories' do
      vcat_digiacomo = create(:video_category, name: 'Digiácomo Dias')
      vcat_digiacomo.children.create(name: 'Series')
      vcat_digiacomo.children.create(name: 'Event videos')
      vcat_isabel = create(:video_category, name: 'Isabel Clark')
      vcat_isabel.children.create(name: 'Series')
      vcat_isabel.children.create(name: 'Event videos')
      vcat_ekaterina = create(:video_category, name: 'Ekaterina Ilyukhina')

      visit root_path

      within('li.submenu-item', text: 'Home') do
        menu = find('li.subsubmenu-item', text: 'Digiácomo Dias')
        menu.find_link('Digiácomo Dias', href: video_category_path(vcat_digiacomo))
        submenu = menu.find('ul.subsubmenu li', text: 'Series')
        submenu.find_link('Series', href: video_category_path(vcat_digiacomo.children.first))
        submenu = menu.find('ul.subsubmenu li', text: 'Event videos')
        submenu.find_link('Event videos', href: video_category_path(vcat_digiacomo.children.last))

        menu = find('li.subsubmenu-item', text: 'Isabel Clark')
        menu.find_link('Isabel Clark', href: video_category_path(vcat_isabel))
        submenu = menu.find('ul.subsubmenu li', text: 'Series')
        submenu.find_link('Series', href: video_category_path(vcat_isabel.children.first))
        submenu = menu.find('ul.subsubmenu li', text: 'Event videos')
        submenu.find_link('Event videos', href: video_category_path(vcat_isabel.children.last))

        menu = find('li', text: 'Ekaterina Ilyukhina')
        menu.find_link('Ekaterina Ilyukhina', href: video_category_path(vcat_ekaterina))
      end
    end
  end
end