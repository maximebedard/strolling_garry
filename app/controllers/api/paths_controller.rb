class Api::PathsController < ApplicationController

  def index
    render json: current_user.paths
  end

  def show
    render json: current_user.paths.find(params[:id])
  end

  def create
    @path = Path.new(params[:path])

    if @path.save
      current_user.paths << @path
      render json:@path, status: :created
    else
      render json:@path.errors, status: :unprocessable_entity
    end

  end

  def update
    @path = current_user.paths.find(params[:id])

    if @path.update_attributes(params[:path])
      head :no_content
    else
      render json:@path.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @path = current_user.paths.find(params[:id])
    @path.destroy
    head :no_content
  end

end
