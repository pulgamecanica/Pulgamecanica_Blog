module Authors
	class TagsController < AuthorsController
    # protect_from_forgery
    before_action :set_author
    before_action :set_tag, only: %i[ update destroy ]

    # GET /tag or /tag.json
    def index
      @tags = Tag.all
      @new_tag = Tag.new
    end

    # POST /tags or /posts.json
    def create
      @tag = Tag.all.build(tag_params)

      respond_to do |format|
        if @tag.save
          format.html { redirect_to tags_path, notice: "Tag was successfully created." }
          format.json { render :index, status: :created, location: @tag }
        else
          format.html { render :index, status: :unprocessable_entity }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tags/1 or /posts/1.json
    def update
      respond_to do |format|
        if @tag.update(tag_params)
          format.html { redirect_to tags_path, notice: "Tag was successfully updated." }
          format.json { render :edit, status: :ok, location: @tag }
        else
          format.html { render :index, status: :unprocessable_entity }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tags/1 or /tags/1.json
    def destroy
      @tag.destroy

      respond_to do |format|
        format.html { redirect_to tags_url, notice: "Tag was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_tag
        @tag = Tag.find(params[:id])
      end

      def tag_params
        params.require(:tag).permit(:title, :icon_svg, :color)
      end
	end
end