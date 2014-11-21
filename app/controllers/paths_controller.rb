class PathsController < ApplicationController

  # This is Devise's authentication
  before_filter :authenticate_user!

  # GET /paths
  # GET /paths.json
  def index
    @paths = Path.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paths }
    end
  end

  # GET /paths/1
  # GET /paths/1.json
  def show
    @path = Path.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @path }
    end
  end

  # GET /paths/new
  # GET /paths/new.json
  def new
    @path = Path.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @path }
    end
  end

  # GET /paths/1/edit
  def edit
    @path = Path.find(params[:id])
  end

  # POST /paths
  # POST /paths.json
  def create
    @path = Path.new(path_params)

    respond_to do |format|
      if @path.save
        format.html { redirect_to @path, notice: 'Path was successfully created.' }
        format.json { render json: @path, status: :created, location: @path }
      else
        format.html { render action: "new" }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paths/1
  # PUT /paths/1.json
  def update
    @path = Path.find(params[:id])

    respond_to do |format|
      if @path.update_attributes(path_params)
        format.html { redirect_to @path, notice: 'Path was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paths/1
  # DELETE /paths/1.json
  def destroy
    @path = Path.find(params[:id])
    @path.destroy

    respond_to do |format|
      format.html { redirect_to paths_url }
      format.json { head :no_content }
    end
  end

  private

  def path_params
    params.require(:path).permit(:name, :mode, :date, :distance, :distance_time, :path_type, :branch_id, client_ids:[], potential_client_ids:[])
  end


end
