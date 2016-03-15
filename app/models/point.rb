class Point < ActiveRecord::Base
  belongs_to :user
  validates :lat, :lng, :user_uid, presence: true
  validates :lat, :lng, numericality: true
  validates :lat, :inclusion => -90..90
  validates :lng, :inclusion => -180..180

  def as_json(options)
  	result = super
  	result["user_skills"] = self.user.skills
  	result
  end

end