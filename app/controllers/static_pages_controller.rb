class StaticPagesController < ApplicationController
  def index
    # @todo Add caching of the data, for large tables
    # performance of the RANDOM order in DB is bad
    @resort = Resort.order('RANDOM()').first

    @tip = Tip.order('RANDOM()').first
  end
end
