class User < ActiveRecord::Base
  after_create :set_su
  has_many :comments
  has_many :articles

  def self.from_omniauth(auth)
    optional_user = find_by(uid: auth.uid)
    user = optional_user ? optional_user : User.newa
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
    user
  end

  private

  def set_su
  #  su =  user.name == "Michał Konrad Rusinek"
    su = false
  end
end
