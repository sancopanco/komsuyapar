class User < ActiveRecord::Base
  has_many :points
  has_many :reports
  has_many :received_messages, :class_name => 'Message', :foreign_key => :recipient_id
  
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

  def self.text_search(query)
    if query.present?
      User.tagged_with([query],:any=>true, :wild => true)
    else
      User.all
    end

  end

end