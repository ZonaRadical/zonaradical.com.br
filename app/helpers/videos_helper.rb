module VideosHelper
  def getYoutubeEmbedLink url
    id = extract_youtube_id(url)
    'http://www.youtube.com/embed/'+id+'?rel=0&autoplay=0'
  end

  def getVimeoEmbedLink url
    video_id = extract_vimeo_id(url)
    src = "//player.vimeo.com/video/#{video_id}"
    src
  end

  def thumbnail(url, options = {})
    if url =~ /youtube/
      youtube_thumbnail(url, options)
    else
      vimeo_thumbnail(url, options)
    end
  end

  private

  def youtube_thumbnail(url, options = {})
    size = options[:size] ||= :high
    id = extract_youtube_id(url)
    image_tag("https://i.ytimg.com/vi/#{id}/#{YOUTUBE_FILES[size]}.jpg")
  end

  def vimeo_thumbnail(url, options = {})
    size = options[:size] ||= :large
    id = extract_vimeo_id(url)
    video_info = Vimeo::Simple::Video.info(id)
    image_tag(video_info[0][VIMEO_FILES[size]])
  end

  def extract_youtube_id(url)
    /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/.match(url)[2]
  end

  def extract_vimeo_id(url)
    /^.*(vimeo.com\/)([0-9].*)/.match(url)[2]
  end

  YOUTUBE_FILES = {
    default: 'default',
    medium: 'mqdefault',
    high: 'hqdefault',
    standard: 'sddefault',
    maxres: 'maxresdefault'
  }

  VIMEO_FILES = {
    small: 'thumbnail_small',
    medium: 'thumbnail_medium',
    large: 'thumbnail_large'
  }
end
