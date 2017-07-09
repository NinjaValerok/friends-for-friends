# == Schema Information
#
# Table name: feeds
#
#  id                  :integer          not null, primary key
#  message             :text
#  external_id         :string
#  provider            :string
#  type                :string
#  author_uid          :string
#  provider_type       :string
#  provider_created_at :datetime
#  provider_updated_at :datetime
#  author_id           :integer
#  created_at          :datetime
#

# При обновлении фида создавать юзера из поля from

class Feed < ApplicationRecord
  # before_save :parse_message, if: ->() { message.present? }
  searchkick word_start: [:message, :type, :created_at]
  paginates_per 8
  class << self
    def update_feed
      feeds = get_raw_feeds
      # feed.next_page
      feeds.each do |raw_feed|
        external_id = raw_feed['id']
        break if Feed.find_by(external_id: external_id, provider: 'facebook')
        user = User.from_feed raw_feed['from']
        Feed.create(
          message: raw_feed['message'], 
          external_id: external_id, 
          provider: 'facebook',
          author_uid: raw_feed['from']['id'],
          provider_type: raw_feed['type'],
          provider_created_at: raw_feed['created_time'],
          provider_updated_at: raw_feed['updated_time'],
          author_id: user.try(:id)
        )
      end
    end

    def get_raw_feeds
      oauth = Koala::Facebook::OAuth.new(FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'])
      access_token = oauth.get_app_access_token
      graph = Koala::Facebook::API.new(access_token)
      graph.get_connection(
        '509679185734909', 
        'feed', 
        fields: ['message', 'id', 'from', 'type', 'picture', 'link', 'created_time', 'updated_time']
      )
    end
  end

  def search_data
    {
      id: id,
      message: message,
      link: link,
    }
  end

  def link
    return unless external_id && provider
    "https://www.facebook.com/#{external_id}"
  end

end
