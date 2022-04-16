module Authors
  class PostsController < AuthorsController
    before_action :set_author
    before_action :set_post, only: %i[ edit update destroy ]


    def publish
      post = @author.posts.find(params[:post_id])
      post.update(published: true, published_at: Time.now)
    end

    def unpublish
      post = @author.posts.find(params[:post_id])
      post.update(published: false, published_at: nil)    
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
        params.require(:post).permit(:title, :description, :header_image)
      end
  end
end