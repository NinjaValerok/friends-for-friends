namespace :feed do
  task :update do
    Feed.destroy_all
    oauth = Koala::Facebook::OAuth.new(FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'])
    access_token = oauth.get_app_access_token
    graph = Koala::Facebook::API.new(access_token)
    graph.get_connection('509679185734909', 'feed').each do |raw_feed|
      Feed.create(message: raw_feed['message'], external_id: raw_feed['id'], updated: raw_feed['updated_time'])
    end
  end
end
