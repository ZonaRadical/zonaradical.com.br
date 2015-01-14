module VideosHelper
  def getEmbedLink url
    id = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/.match(url)[2]
    'http://www.youtube.com/embed/'+id+'?rel=0&autoplay=0'
  end
end