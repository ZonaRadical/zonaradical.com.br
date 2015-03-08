require 'rails_helper'

feature 'videos page' do
  scenario 'show thumbnail of the videos', focus: true do
    vc = VideoCategory.create(name: 'Misturados', description: 'Vídeos diversos.')
    yt_video = vc.videos.create(title: 'DOMINGO NO PARQUE 2015, PARTE 1', source_link: 'https://www.youtube.com/watch?v=cUj2lCGwOhs')
    vimeo_video = vc.videos.create(title: 'QUANDOS OS CÃES PRATICAM SNOWBOARD', source_link: 'https://vimeo.com/9168398')

    VCR.use_cassette('videos_page_thumbnail') do
      visit videos_path

      within "#video_#{yt_video.id}" do
        expect(page).to have_selector('img[src="https://i.ytimg.com/vi/cUj2lCGwOhs/hqdefault.jpg"]')
        expect(page).to have_link('', href: video_path(yt_video))
      end

      within "#video_#{vimeo_video.id}" do
        expect(page).to have_selector('img[src="https://i.vimeocdn.com/video/44706303_640.jpg"]')
        expect(page).to have_link('', href: video_path(vimeo_video))
      end
    end
  end
end