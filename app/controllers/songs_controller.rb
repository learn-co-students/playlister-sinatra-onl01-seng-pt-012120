require 'rack-flash'

class SongsController < ApplicationController
	use Rack::Flash

	get '/songs' do
		@songs = Song.order(:name)
		erb :'/songs/index'
	end

	get '/songs/new' do
		@genres = Genre.order(:name)

		erb :'/songs/new'
	end

	get '/songs/:slug' do
		@song = Song.find_by_slug(params[:slug])
		@genres = @song.genres

		erb :'/songs/show'
	end

	get '/songs/:slug/edit' do
		@song = Song.find_by_slug(params[:slug])
		@genres = Genre.order(:name)

		erb :'/songs/edit'
	end

	post '/songs' do

		song = Song.create(name: params[:song][:name])
		song.artist = Artist.find_or_create_by(name: params[:song][:artist])
		song.genre_ids = params[:genres]
		song.save

		flash[:message] = "Successfully created song."

		redirect "/songs/#{song.slug}"
	end

	patch '/songs/:slug' do
		song = Song.find_by_slug(params[:slug])
		song.update(name: params[:song][:name], artist: Artist.find_or_create_by(name: params[:song][:artist]))
		song.genre_ids = params[:genres]

		flash[:message] = "Successfully updated song."

		redirect "/songs/#{song.slug}"
	end


end