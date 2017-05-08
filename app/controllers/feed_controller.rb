class FeedController < ApplicationController
  def index
    oauth = Koala::Facebook::OAuth.new(FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'])
    access_token = oauth.get_app_access_token
    graph = Koala::Facebook::API.new(access_token)
    @feeds = graph.get_connection('509679185734909', 'feed')
  end
end
