# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  nick_name           :string
#  phone               :string
#  avatar              :string
#  email               :string
#  encrypted_password  :string
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0)
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#

# TODO: При регистрации пользователя искать его посты по Feed#gitauthor_uid
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:facebook]
  searchkick word_start: %i[nick_name email phone]

  class << self
    # TODO: надо обновлять не заполненые данны
    def from_omniauth(auth, signed_in_resource = nil)
      identity = Identity.from_oauth(auth)
      user = signed_in_resource ? signed_in_resource : identity.user

      unless user
        user = User.new(
          nick_name: auth.info.name,
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          email: auth.info.email,
          avatar: auth.info.image
        )
        user.save!
      end

      # Associate the identity with the user if needed
      if identity.user != user
        identity.user = user
        identity.save!
      end
      user
    end

    def from_feed(feed)
      return unless feed['from']
      Identity.find_by(uid: feed['from']['id'], provider: 'facebook').try(:user)
    end

    def create_from_feed(feed)
      create(nick_name: feed.name)
    end
  end
end
