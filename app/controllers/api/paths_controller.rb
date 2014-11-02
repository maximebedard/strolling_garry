class Api::PathsController < ApplicationController

  def index
    render json: Path.all
  end

  def show
    render json: Path.find(params[:id])
  end

  def create
    @path = Path.new(params[:path])

    if @path.save
      render json:@path, status: :created
    else
      render json:@path.errors, status: :unprocessable_entity
    end

  end

  def update
    @path = Path.find(params[:id])

    if @path.update_attributes(params[:path])
      head :no_content
    else
      render json:@path.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @path = Path.find(params[:id])
    @path.destroy
    head :no_content
  end

end
