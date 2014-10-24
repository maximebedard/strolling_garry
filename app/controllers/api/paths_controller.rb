class Api::PathsController < ApplicationController

  respond_to :json

  def index
    respond_with Path.all
  end

  def show
    respond_with Path.find params[:id]
  end

  def create
    respond_with Path.create(params[:path])
  end

  def update
    respond_with Path.update(params[:id], params[:products])
  end

  def destroy
    respond_with Path.destroy(params[:id])
  end

end
