require_relative './concerns/slug_module'

class Artist < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods

	has_many :songs
	has_many :genres, through: :songs


	# def self.find_by_slug(slug)
	# 	self.all.find {|instance| instance.slug == slug} 
	# end

end