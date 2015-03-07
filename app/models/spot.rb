class Spot < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

  #nearbys = Spot.all(:order => "distance")
end
