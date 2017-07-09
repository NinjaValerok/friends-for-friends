class FeedController < ApplicationController
  def index
    @feeds = Feed.all.page(params[:page] || 1)
  end
end
