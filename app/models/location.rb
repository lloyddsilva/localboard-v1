class Location < ActiveRecord::Base
	has_paper_trail

	after_validation :geocode, :reverse_geocode, :if => :address_changed?

	geocoded_by :address

	has_many :posts

	reverse_geocoded_by :latitude, :longitude do |obj,results|
		logger.debug "DEBUG::#{results}"
		if geo = results.first
			obj.country = geo.country.titleize
			obj.city = geo.city.titleize
			obj.postal_code = geo.postal_code
			obj.street_name = geo.route
			obj.block_number = geo.street_number
			obj.address = geo.formatted_address

			
		end
	end
end
