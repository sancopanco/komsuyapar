class User < ActiveRecord::Base
  include AlgoliaSearch
  has_many :points, dependent: :destroy
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

  algoliasearch per_environment: true, enqueue: true  do
    # all attributes will be sent
    attribute :name
    attribute :username
    attribute :email
    add_attribute :city
    add_attribute :country
    add_attribute :_geoloc
    add_attribute :address 
    attribute :skills do
      skills.map do |s|
        { title: s.name, taggings_count: s.taggings_count }
      end
    end
    attributesToIndex ['country', 'city', 'name', 'skills']
    attributesForFaceting [:city] # use these attributes for faceting
    #customRanking ['desc(followers)'] # nb_followers reflect the record popularity
    customRanking ['desc(_geoloc)']
    queryType 'prefixAll' # prefix query on all words
    removeWordsIfNoResults "allOptional"
  end

  def city
    return @city if @city
    point  = self.points.last
    if point
      point_query = "#{point.lat}, #{point.lng}"
      result = Geocoder.search(point_query)
      if result.first
        return result.first.province
      end
    end
    return "İstanbul"
  end

  def city=(c)
    @city = c
  end

  def country
    "Türkiye"
  end

  def address
    point  = self.points.last
    point.address if point
  end

  def _geoloc
    #could be more point
    point  = self.points.last
    {lat:point.lat.to_f, lng: point.lng.to_f} if point
  end


end