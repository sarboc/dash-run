class ThingsController < ApplicationController
  respond_to :json

  def show_admin
    thing = Thing.find_by_admin_url(params[:admin_url])

    respond_with thing, include: {contributors: {only: [:name, :contribution, :email, :note]}}, only: [:title, :description, :public_url, :time, :admin_name, :admin_email, :square_cash_email, :venmo_id, :min_contribution, :total_contributors, :total_contributions]
  end

  def show_public
    thing = Thing.find_by_public_url(params[:public_url])
    respond_with thing, include: {contributors: {only: [:name]}}, only: [:title, :description, :time, :admin_name, :square_cash_email, :venmo_id, :min_contribution, :total_contributors, :total_contributions]
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

    thing.time = DateTime.parse("#{params[:date]} #{params[:time]}").change(offset: Time.now.zone)
    thing.save

    respond_with thing
  end

  def update
    thing = Thing.find_by_admin_url(params[:admin_url])

    if thing
      thing.admin_name = params[:admin_name]
      thing.admin_email = params[:admin_email]
      thing.venmo_id = params[:venmo_id]
      thing.square_cash_email = params[:square_cash_email]
      thing.title = params[:title]
      thing.description = params[:description]
      thing.min_contribution = params[:min_contribution].to_i
      thing.time = DateTime.parse(params[:time])
      thing.save

      respond_with thing
    else
      render nothing: true
    end
  end

end
