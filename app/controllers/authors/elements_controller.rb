module Authors
  class ElementsController < PostsController
    # protect_from_forgery
    before_action :set_author
    before_action :set_post
    before_action :set_element, only: %i[ update destroy ]

    # POST /elements or /elements.json
    def create
      @element = @post.elements.build(element_params)
      if (element_params["element_type"] == "title")
        title = @element.build_title(title_type: 0)
      end
      respond_to do |format|
        if @element.save
          format.html { redirect_to edit_post_path(@post), notice: "Element was successfully created." }
          format.json { render :edit, status: :created, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @element.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /elements/1 or /elements/1.json
    def update
      respond_to do |format|
        if @element.update(element_params)
          format.html { redirect_to edit_post_path(@post), notice: "Element was successfully updated." }
          format.json { render :edit, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @element.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /elements/1 or /elements/1.json
    def destroy
      @element.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Element was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

      def set_author
        @author = current_author
      end
      
      def set_post
        @post = @author.posts.friendly.find(params[:post_id])
      end

      def set_element
        @element = @post.elements.find(params[:id])
      end

      def element_params
        params.require(:element).permit(:element_type, :content, :image, :file_pdf, :code_file)
      end
  end
end