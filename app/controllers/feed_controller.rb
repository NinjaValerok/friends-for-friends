# frozen_string_literal: true

class FeedController < ApplicationController
  def index
    @feeds =
      @feeds = if params[:query].present?
                 # Movie.where("title LIKE ? OR plot LIKE ?", "%#{search}%", "%#{search}%")
                 Feed.search(params[:query], page: params[:page], per_page: 8)
               else
                 Feed.all.page(params[:page] || 1)
      end
  end

  def update
    Feed.update_feed
    redirect_to root_path
  end
end
