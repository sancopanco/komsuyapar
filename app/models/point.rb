class Point < ActiveRecord::Base
  acts_as_taggable
  validates :lat, :lng, :user_uid, presence: true
  validates :lat, :lng, numericality: true
  validates :lat, :inclusion => -90..90
  validates :lng, :inclusion => -180..180

  def as_json(options)
  	result = super
  	result["tags"] = self.tags
  	result
  end

end