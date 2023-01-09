class VisitorsController < ApplicationController
	layout 'visitors'
	before_action :record_page_view

  def record_page_view
    # Add a condition to record only your canonical domain
    # and use a gem such as crawler_detect to skip bots.
    ActiveAnalytics.record_request(request)
  end
end
