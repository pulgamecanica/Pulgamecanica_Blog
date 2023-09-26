module Visitors
  class HomeController < VisitorsController
    protect_from_forgery
    
    def projects
      #render html: "<h1>Hello</h1>".html_safe
      @projects = Project.all.where(published: true).order(updated_at: :desc)
    end
  end
end