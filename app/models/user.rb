class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

def self.from_omniauth(auth, signed_in_resource = nil)
    identity = Identity.for_oauth(auth)
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
end
