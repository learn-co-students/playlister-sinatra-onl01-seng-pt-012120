class Slugifiable
	module Slug
		def slug
			name.downcase.gsub(" ", "-")
		end
	end
end