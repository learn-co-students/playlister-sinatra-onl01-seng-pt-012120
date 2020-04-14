class Song < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods

	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	# def self.find_by_slug(slug)
	# 	self.all.find {|instance| instance.slug == slug} 
	# end

end