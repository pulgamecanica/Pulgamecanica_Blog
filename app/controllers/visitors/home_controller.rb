module Visitors
  class HomeController < VisitorsController
    
    def about
    end

    def cv
    end
    
    def projects
      #render html: "<h1>Hello</h1>".html_safe
      @projects = Project.all.where(published: true).order(:order)
    end
  end
end