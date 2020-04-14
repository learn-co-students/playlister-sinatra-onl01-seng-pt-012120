class ArtistsController < ApplicationController

	get '/artists' do
		@artists = Artist.order(name: :asc)

		erb :'/artists/index'
	end

	get '/artists/:slug' do
		@artist = Artist.find_by_slug(params[:slug])
		@genres = @artist.genres

		erb :'/artists/show'
	end

end
