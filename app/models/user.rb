class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError
    logger.info e.to_s
    nil
  end
  
  # sample method - friends count of login user
  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size }
  end
  
  # sample method - feeds of login user
  def feeds
    facebook.get_connection("me", "feed")
  end
  
  # sample method - profile of login user
  def profile
    facebook.get_object("me")
  end
end
