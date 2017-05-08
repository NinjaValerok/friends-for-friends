class Feed < ApplicationRecord
  before_save :parse_message
  # before_save { |feed| feed.rent = true}

  class << self
    def update_feed
      Feed.destroy_all
      oauth = Koala::Facebook::OAuth.new(FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'])
      access_token = oauth.get_app_access_token
      graph = Koala::Facebook::API.new(access_token)
      graph.get_connection('509679185734909', 'feed').each do |raw_feed|
        if raw_feed['message']
          Feed.create(message: raw_feed['message'], external_id: raw_feed['id'], updated: raw_feed['updated_time'])
        else
          puts "----------" * 10
          puts "FUCK"
          puts raw_feed
        end
      end
    end
  end

  private

  def parse_message
    if message.include?('сдаю')
      self.rent = true
    elsif message.include?('ищу')
      self.search = true
    end
  end
end
