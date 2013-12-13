class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter do
  #   respond_to do |format|
  #     format.html { index and return false }
  #     format.json { render :json }
  #   end
  #   # if request.xhr?
  #   # # if request is an HTML request
  #   # # don't do the normal thing (and return false)
  #   #   render_frontend and return false
  #   # else
  #   #   # nothing
  #   # end
  # end

  before_filter :export_i18n_messages

  def export_i18n_messages
    DashRun::I18n.export! if Rails.env.development?
  end

  def index
    render text: '', layout: true
  end
end
