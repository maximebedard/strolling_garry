class PathsController < ApplicationController

  layout 'map', only: [:show]

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
      format.js # show.js.erb
      format.json { render json: @path }
    end
  end

  def clients
    respond_to do |format|
      format.json { render json: @path.clients }
    end
  end

  def potential_clients
    respond_to do |format|
      format.json { render json: @path.potential_clients }
    end
  end


  # GET /paths/new
  # GET /paths/new.json
  def new
    @path = current_user.paths.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @path }
    end
  end

  # GET /paths/1/edit
  def edit
  end

  # POST /paths
  # POST /paths.json
  def create
    @path = current_user.paths.build(path_params)

    respond_to do |format|
      if @path.save
        format.html { redirect_to paths_path, flash: {info: 'Path was successfully created.', selected: @path.id} }
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
    respond_to do |format|
      if @path.update_attributes(path_params)
        format.html { redirect_to @path, info: 'Path was successfully updated.' }
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
    @path.destroy

    respond_to do |format|
      format.html { redirect_to paths_url }
      format.json { head :no_content }
    end
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
