module Authors
  class TitleController < AuthorsController
  	# protect_from_forgery
    # before_action :set_post
    before_action :set_element

  	# PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @element.title.update(title_params)
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully updated." }
          format.json { render :edit, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
    
    private

    	def set_element
        @author = current_author
        @post = @author.posts.friendly.find(params[:post_id])
        @element = @post.elements.find(params[:element_id])
      end
      
      # Only allow a list of trusted parameters through.
      def title_params
        params.require(:title).permit(:name, :title_type)
      end
  end
end