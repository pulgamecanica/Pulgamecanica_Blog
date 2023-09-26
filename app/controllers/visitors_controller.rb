class VisitorsController < ApplicationController
	layout 'visitors'
	before_action :record_page_view
  before_action :set_pages
  
  def record_page_view
    # Add a condition to record only your canonical domain
    # and use a gem such as crawler_detect to skip bots.
    ActiveAnalytics.record_request(request)
  end

  def set_pages
    @pages = Page.where(published: true).order(published_at: :desc)
  end
end
