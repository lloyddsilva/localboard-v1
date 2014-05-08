class Location < ActiveRecord::Base
	has_paper_trail

	after_validation :geocode, :reverse_geocode, :if => :address_changed?

	geocoded_by :address

	has_many :posts
end
