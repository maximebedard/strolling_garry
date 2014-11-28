class BranchesController < ApplicationController

  before_action :must_be_admin!, except:[:index, :show]

  before_action :set_branch, except: [:index, :create, :new]

  def index
    @branches = Branch.all.page(params[:page]).per(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branches }
    end
  end

  def show
    respond_to do |format|
      format.js
      format.json { render json: @branch }
    end
  end

  def edit
  end

  def new
    @branch = Branch.new
    @branch.build_address
  end

  def create
    @branch = Branch.new(branch_params)

    if @branch.save
      redirect_to branches_path, flash: {info: 'Branch was successfully created.'}
    else
      render action: "new"
    end
  end

  def update
    if @branch.update_attributes(branch_params)
      redirect_to branches_path, flash: {info: 'Branch was successfully updated.'}
    else
      render action: "edit"
    end
  end

  def destroy
    @branch.destroy
    redirect_to branches_path, flash: {info: "Branch was successfully deleted."}
  end

  private

    def set_branch
      @branch = Branch.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit(:name, :description, address_attributes: [
          :number, :street, :city, :province, :country, :postal_code])
    end

    def must_be_admin!
      authenticate_user!
      redirect_to root_path, alert:"You do not have the required permissions to access this content." unless current_user.admin?
    end
end
