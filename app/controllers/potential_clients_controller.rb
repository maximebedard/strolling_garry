class PotentialClientsController < ApplicationController
  def index
    @potential_clients = PotentialClient.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @potential_clients }
    end
  end

  def edit
    @potential_client = PotentialClient.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @potential_client }
    end
  end

  def new
    @potential_client = PotentialClient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @potential_client }
    end
  end

  def create
    @potential_client = PotentialClient.new(params[:potential_client])

    respond_to do |format|
      if @potential_client.save
        format.html { redirect_to @potential_client, notice: 'Potential client was successfully created.' }
        format.json { render json: @potential_client, status: :created, location: @potential_client }
      else
        format.html { render action: "new" }
        format.json { render json: @potential_client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @potential_client = PotentialClient.find(params[:id])

    respond_to do |format|
      if @potential_client.update_attributes(params[:potential_client])
        format.html { redirect_to @potential_client, notice: 'Potential client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @potential_client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @potential_client = PotentialClient.find(params[:id])
    @potential_client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
end
