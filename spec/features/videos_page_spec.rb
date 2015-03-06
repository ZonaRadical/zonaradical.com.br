require 'rails_helper'

feature 'videos page' do
  scenario 'show thumbnail of the videos', focus: true do
    vc = VideoCategory.create(name: 'Misturados', description: 'Vídeos diversos.')
    video = vc.videos.create(title: 'DOMINGO NO PARQUE 2015, PARTE 1', source_link: 'https://www.youtube.com/watch?v=cUj2lCGwOhs')

    visit videos_path

    within "#video_#{video.id}" do
      expect(page).to have_selector('img[src="https://i.ytimg.com/vi/cUj2lCGwOhs/hqdefault.jpg"]')
      expect(page).to have_link('', href: video_path(video))
    end
  end
end