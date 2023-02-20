class AuthorsController < ApplicationController
	before_action :authenticate_author!

	layout 'authors'

	def index
		@posts = current_author.posts.where(published: true)
		@tags = Tag.all
	end
end
