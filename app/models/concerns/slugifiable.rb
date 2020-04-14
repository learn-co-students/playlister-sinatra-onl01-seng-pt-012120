class Slugifiable
	module Slug
		def slug
			name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
		end
	end
end