module Visitors
  class PagesController < VisitorsController
    protect_from_forgery
    
    def index
    end

    def show
      @page = @pages.friendly.find(params[:id])
    end

    private
  end
end