class User < ActiveRecord::Base
  
  # validations
  validates :provider, :uid, :name, :oauth_token, :image_url, presence: true
  
  # this validations are checked when updating user because can be nil when we authenticate through twitter
  validates :email, uniqueness: true, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i }, :on => :update
  validates :first_name, presence:true, :on => :update
  validates :last_name, presence:true, :on => :update
  validates :gender, presence:true, :on => :update
  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"] # nil when provider = twitter
      user.first_name = auth["info"]["first_name"] # nil when provider = twitter
      user.last_name = auth["info"]["last_name"] # nil when provider = twitter
      user.gender = auth["extra"]["raw_info"]["gender"] # nil when provider = twitter
      user.image_url = auth["info"]["image"]
      user.oauth_token = auth["credentials"]["token"]
    end
  end
  
end
