module Visitors
  class TagsController < VisitorsController
    protect_from_forgery
    before_action :set_tags

    def show
      @tag = Tag.find(params[:id])
      if @tag
        @projects = @tag.projects.published_projects
        @posts = @tag.posts.published_posts
      end
    end

    def index
      @tags = Tag.left_outer_joins(:posts, :projects).distinct.where(posts: {published: false}).or(Tag.left_outer_joins(:posts, :projects).distinct.where(projects: {published: false}))
    end

    private
      def set_tags
        @tags = Tag.all
      end
  end
end