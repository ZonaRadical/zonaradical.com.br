module VideosHelper
  def getYoutubeEmbedLink url
    id = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/.match(url)[2]
    'http://www.youtube.com/embed/'+id+'?rel=0&autoplay=0'
  end

  def getVimeoEmbedLink url
    video_id = url.sub(/^https?\:\/\//, '').sub(/^www./,'').sub(/^vimeo.com\//,'')
    src = "//player.vimeo.com/video/#{video_id}"
    src
  end

  def thumbnail(url, options = {})
    size = options[:size] ||= :high
    id = extract_youtube_id(url)
    image_tag("https://i.ytimg.com/vi/#{id}/#{YOUTUBE_FILES[size]}.jpg", class: 'youtube')
  end

  private

  def extract_youtube_id(url)
    /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/.match(url)[2]
  end

  YOUTUBE_FILES = {
    default: 'default',
    medium: 'mqdefault',
    high: 'hqdefault',
    standard: 'sddefault',
    maxres: 'maxresdefault'
  }
end
