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

  def thumbnail(video, options = {})
    if video.source_link =~ /youtube/
      youtube_thumbnail(video, options)
    else
      vimeo_thumbnail(video, options)
    end
  end

  private

  def youtube_thumbnail(video, options = {})
    size = options[:size] ||= :high
    id = extract_youtube_id(video.source_link)
    link_to(
      image_tag("https://i.ytimg.com/vi/#{id}/#{YOUTUBE_FILES[size]}.jpg"),
      video_path(video)
    )
  end

  def vimeo_thumbnail(video, options = {})
    size = options[:size] ||= :large
    id = extract_vimeo_id(video.source_link)
    video_info = Vimeo::Simple::Video.info(id)
    link_to(
      image_tag(video_info[0][VIMEO_FILES[size]]),
      video_path(video)
    )
  end

  def extract_youtube_id(url)
    /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/.match(url)[2]
  end

  def extract_vimeo_id(url)
    /^.*(vimeo.com\/)([0..9].*)/.match(url)[2]
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
