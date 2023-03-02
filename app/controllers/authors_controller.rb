class AuthorsController < ApplicationController
	before_action :authenticate_author!

	layout 'authors'

	def index
		@posts = current_author.posts.where(published: true)
		@tags = Tag.all
	end

	def update
		respond_to do |format|
        if current_author.update(author_params)
          format.html { redirect_to the_shire_path, notice: "Changed BG succesfully." }
          format.json { render :index, status: :ok, location: the_shire_path }
        else
          format.html { redirect_to the_shire_path, status: :unprocessable_entity }
          format.json { render json: current_author.errors, status: :unprocessable_entity }
        end
      end
	end

	protected
		def set_author
		  @author = current_author
		end

		def author_params
        params.require(:author).permit(:bg_choice)
		end
end
