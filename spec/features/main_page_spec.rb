require 'rails_helper'

feature 'main page', broken: true do
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

    scenario 'dynamic display forum categories' do
      create(:forem_category, name: 'Travels')
      create(:forem_category, name: 'E-shopping')
      create(:forem_category, name: 'Talk with ZR')

      visit root_path

      within('li.submenu-item', text: 'Forum') do
        Forem::Category.find_each do |f_category|
          menu = find('li', text: f_category.name)
          menu.find_link(f_category.name, href: forem.category_path(f_category))
        end
      end
    end

    scenario 'display last gallery image' do
      tip = create(:tip)
      visit root_path

      within('div.gallery-field') do
        expect(page).to have_link('', href: "/tips/#{tip.id}")
        expect(page).to have_selector("img[src='#{tip.gallery_images.last.image_url}']")
        expect(page).to have_content(tip.title)
        expect(page).to have_content(tip.gallery_images.last.name)
      end
    end
  end
end
