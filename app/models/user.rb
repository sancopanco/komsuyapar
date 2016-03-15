class User < ActiveRecord::Base
  has_many :points
  has_many :reports
  
  acts_as_taggable
  acts_as_taggable_on :skills

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.name = auth["info"]["name"]
    end
  end

end