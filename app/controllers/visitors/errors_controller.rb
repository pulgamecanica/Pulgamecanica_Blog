module Visitors
  class ErrorsController < VisitorsController
    protect_from_forgery
    layout 'errors'

    def not_found
      @posts = Post.published_posts
      render(:status => 404)
    end

    def internal_server_error
      render(:status => 500)
    end
  end
end