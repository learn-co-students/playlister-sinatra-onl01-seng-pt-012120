class Genre < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods

	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	# def self.find_by_slug(slug)
	# 	self.all.find {|instance| instance.slug == slug} 
	# end

end