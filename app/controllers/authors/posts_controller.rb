module Authors
  class PostsController < AuthorsController
    protect_from_forgery except: [:publish, :unpublish, :sort_elements]
    before_action :set_author
    before_action :set_post, only: %i[ edit update destroy publish unpublish sort_elements updateTags removeTag]

    def sort_elements
      elements_sort = JSON.parse(request.body.read());
      elements_sort.each do |element|
        @post.elements.find(element["id"].to_i).update(position: element["position"].to_i);
      end
      render json: {"foo": {"bar": 1, "baz": 2}, "bat": [0, 1, 2]}
    end

    def publish
      @post.update(published: true, published_at: Time.now)
      respond_to do |format|
        if @post.save
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully created." }
          format.json { render :edit, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def unpublish
      @post.update(published: false, published_at: nil)    
      respond_to do |format|
        if @post.save
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully created." }
          format.json { render :edit, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # POST /posts/1/post_tags
    # Setup one or more tags
    def updateTags
      @post_tags = post_tag_params.map{|tag_id| @post.post_tags.build(tag_id: tag_id)}

      respond_to do |format|
        if @post_tags.each(&:save)
          format.html { redirect_to edit_post_path(@post), notice: "Tag was added to the post successfully." }
          format.json { render :edit, status: :created, location: @post }
        else
          format.html { redirect_to edit_post_path(@post), status: :unprocessable_entity, notice: @post_tags.each(&:errors) }
          format.json { render json: @post_tags.each(&:errors), status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1/post_tags/1 or /posts/1/post_tags/1.json
    def removeTag
      @tag = @post.post_tags.find_by(tag_id: params[:tag_id]).destroy

      respond_to do |format|
        format.html { redirect_to edit_post_path(@post), notice: "Tag was succesfully removed." }
        format.json { head :no_content }
      end
    end

    # GET /posts or /posts.json
    def index
      @posts = @author.posts
    end

    # GET /posts/new
    def new
      @post = @author.posts.build
    end

    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
      @post_tags = @post.tags.order(:title)
      @tags = Tag.all.filter{|t| not t.in?(@post_tags)}
    end

    # POST /posts or /posts.json
    def create
      @post = @author.posts.build(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully created." }
          format.json { render :edit, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully updated." }
          format.json { render :edit, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

      def set_author
        @author = current_author
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = @author.posts.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :header_image, :published, :data)
      end

      def post_tag_params
        params.require(:tag_ids)
      end
  end
end