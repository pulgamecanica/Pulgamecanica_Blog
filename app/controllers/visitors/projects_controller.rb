module Visitors
  class ProjectsController < VisitorsController
    protect_from_forgery
    
    def index
      @projects = Project.all.where(published: true).order(updated_at: :desc)
    end
  end
end