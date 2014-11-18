class Api::BranchesController < ApplicationController

  def index
    render json: Branch.all
  end

  def show
    render json: Branch.find(params[:id])
  end

  def create
    @branch = Path.new(params[:branch])

    if @branch.save
      render json:@branch, status: :created
    else
      render json:@branch.errors, status: :unprocessable_entity
    end

  end

  def update
    @branch = current_user.paths.find(params[:id])

    if @branch.update_attributes(params[:branch])
      head :no_content
    else
      render json:@branch.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @branch = current_user.paths.find(params[:id])
    @branch.destroy
    head :no_content
  end

end
