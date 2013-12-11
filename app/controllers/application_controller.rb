class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    unless request.xhr?
    # if request is an HTML request
    # don't do the normal thing (and return false)
      render_frontend and return false
    else
      # nothing
    end
  end

  private
  def render_frontend
    render text: '', layout: true
  end
end
