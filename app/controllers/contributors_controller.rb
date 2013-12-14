class ContributorsController < ApplicationController
  # respond_to :json

  # def show
  #   respond_with 'OK', status: 200
  # end

  def create
    thing = Thing.find_by_public_url(params[:public_url])

    contributor = Contributor.new
    contributor.name = params[:name]
    contributor.email = params[:email]
    contributor.contribution = params[:contribution]
    contributor.note = params[:note]
    contributor.thing = thing
    contributor.save

    render :nothing => true, :status => 200
  end

end
