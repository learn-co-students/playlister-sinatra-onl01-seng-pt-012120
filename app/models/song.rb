class Song < ActiveRecord::Base
	include Slugifiable::Slug

	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def self.find_by_slug(slug)
		name = slug.split("-").collect {|word| word.capitalize}.join(" ")
		self.find_by(name: name)
	end

end