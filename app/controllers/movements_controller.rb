class MovementsController < ApplicationController
  before_action :check_user

  def index
    render :json => Movement.all
  end

  def search
    search_params = {}

    search_params[:id]        = params[:id]        if params[:id]
    search_params[:name]      = params[:name]      if params[:name]
    search_params[:creator]   = params[:creator]   if params[:creator]
    search_params[:location]  = params[:location]  if params[:location]
    search_params[:status]    = params[:status]    if params[:status]

    render :json => Movement.where(search_params)
  end

  def build
    @movement = Movement.new(movement_params)

    if @movement.save
      render :json => @movement
    else
      render :json => { :errors => @movement.errors.full_messages }
    end
  end

  def update
    @movement = Movement.find(params[:id])

    if @movement.update(movement_params)
      render :json => @movement
    else
      ender :json => { :errors => @movement.errors.full_messages }
    end
  end

  def show
    @movement = Movement.find(params[:id])
    render :json => @movement
  end

  def destroy
    @movement = Movement.find(params[:id])
    @movement.destroy

    render :json => {:response => "movement has been destroyed"}
  end

  private

  def movement_params
    params.permit(:name, :description, :location, :status, :creator)
  end

  def check_user

  end
end
