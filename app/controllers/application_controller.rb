class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do
    respond_to do |format|
      format.html { render_frontend and return false }
      format.json { render :json }
    end
    # if request.xhr?
    # # if request is an HTML request
    # # don't do the normal thing (and return false)
    #   render_frontend and return false
    # else
    #   # nothing
    # end
  end

  private
  def render_frontend
    render text: '', layout: true
  end
end
