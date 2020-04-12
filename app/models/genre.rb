class Genre < ActiveRecord::Base
	include Slugifiable::Slug

	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def self.find_by_slug(slug)
		name = slug.split("-").collect {|word| word.capitalize}.join(" ")
		self.find_by(name: name)
	end

end