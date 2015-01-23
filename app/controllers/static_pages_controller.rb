class StaticPagesController < ApplicationController
  def index
    # @todo Add caching of the data, for large tables
    # performance of the RANDOM order in DB is bad
    @resort = Resort.order('RANDOM()').first

    @tip = Tip.order('RANDOM()').first
    @tipsOrdered = Tip.order(created_at: :desc)[0..2]
    @breezes = Breeze.last(10)
  end
end
