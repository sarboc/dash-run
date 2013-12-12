class ThingsController < ApplicationController
  respond_to :json

  def show

  end

  def create
    thing = Thing.new
    thing.admin_name = params[:admin_name]
    thing.admin_email = params[:admin_email]
    thing.venmo_id = params[:venmo_id]
    thing.square_cash_email = params[:square_cash_email]
    thing.title = params[:title]
    thing.description = params[:description]
    thing.min_contribution = params[:min_contribution].to_i
    date = params[:date].to_datetime
    time = params[:time].split ":"
    thing.time = date.change({hour: time[0].to_i, min: time[1].to_i })
    thing.save

    respond_with thing
  end

  def update
  end

end
