module Visitors
  class PostsController < VisitorsController
    protect_from_forgery
    before_action :set_posts
    def index
    end

    def show
      @post = @posts.find(params[:id])
      @full_img = true;
    end

    private

    def set_posts
      @posts = Post.where(published: true).order(published_at: :desc)
    end
  end
end