class StaticPagesController < ApplicationController
  def index
    @resort = Resort.all.sample
    @tip = Tip.all.sample
  end
end
