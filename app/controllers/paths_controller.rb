class PathsController < ApplicationController

  # Set custom layout for map action
  layout 'map', only: [:map]

  # This is Devise's authentication
  before_action :authenticate_user!

  before_action :set_path, except: [:index, :create, :new]

  # GET /paths
  # GET /paths.json
  def index
    @paths = current_user.paths.all.page(params[:page]).per(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paths }
    end
  end

  # GET /paths/1
  # GET /paths/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @path }
    end
  end

  # GET /paths/1/clients.json
  def clients
    respond_to do |format|
      format.json { render json: @path.clients }
    end
  end

  # GET /paths/1/potential_clients.json
  def potential_clients
    respond_to do |format|
      format.json { render json: @path.potential_clients }
    end
  end

  def map
  end

  # GET /paths/new
  def new
    @path = current_user.paths.build
  end

  # GET /paths/1/edit
  def edit
  end

  # POST /paths
  def create
    @path = current_user.paths.build(path_params)
    if @path.save
      redirect_to map_path_path(@path), flash: {info: 'Path was successfully created.'}
    else
      render action: "new"
    end
  end

  # PUT /paths/1
  def update
    if @path.update_attributes(path_params)
      redirect_to map_path_path(@path), info: 'Path was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /paths/1
  def destroy
    @path.destroy
    redirect_to paths_path, flash: {info: "Path was successfully deleted."}
  end

  private

    def set_path
      @path = current_user.paths.find(params[:id])
    end

    def path_params
      params.require(:path).permit(:name, :mode, :date, :distance,
        :distance_time, :path_type, :branch_id,
        client_ids:[], potential_client_ids:[])
    end


end
