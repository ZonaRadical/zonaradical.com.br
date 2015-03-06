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
end
