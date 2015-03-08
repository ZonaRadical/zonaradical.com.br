require "spec_helper"
require "rails_helper"

describe VideosHelper do
  describe "Get Youtube Embedded Link" do
    it "When is a correct url" do
      url = "https://www.youtube.com/watch?v=amBUU_ZghJQ"
      expect(helper.getYoutubeEmbedLink(url)).to  eq("http://www.youtube.com/embed/amBUU_ZghJQ?rel=0&autoplay=0")
    end
  end
  describe "Get Vimeo Embedded Link" do
    it "When is a correct url" do
      url = "https://vimeo.com/8051060"
      expect(helper.getVimeoEmbedLink(url)).to  eq("//player.vimeo.com/video/8051060")
    end
  end
end
