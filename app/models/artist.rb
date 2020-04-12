require_relative './concerns/slugifiable'

class Artist < ActiveRecord::Base
	include Slugifiable::Slug

	has_many :songs
	has_many :genres, through: :songs

	# def slug
	# 	name.downcase.gsub(" ", "-")
	# end

	def self.find_by_slug(slug)
		name = slug.split("-").collect {|word| word.capitalize}.join(" ")
		self.find_by(name: name)
	end

end