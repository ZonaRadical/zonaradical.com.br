class StaticPagesController < ApplicationController
  def index
    @resorts = Resort.all
    @resort = Resort.all.sample
  end
end
