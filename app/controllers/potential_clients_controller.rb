class PotentialClientsController < ApplicationController

  before_action :set_potential_client, except:[:index, :create, :new]

  def index
    @potential_clients = PotentialClient.all.page(params[:page]).per(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @potential_clients }
    end
  end

  def show
    respond_to do |format|
      format.js
      format.json { render json: @potential_client }
    end
  end

  def edit
  end

  def new
    @potential_client = PotentialClient.new
    @potential_client.build_address
  end

  def create
    @potential_client = PotentialClient.new(potential_client_params)
    if @potential_client.save
      redirect_to potential_clients_path, info: 'Potential client was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @potential_client.update_attributes(potential_client_params)
      redirect_to potential_clients_path, info: 'Potential client was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @potential_client.destroy
    redirect_to potential_clients_path, flash: {info: "Potential client was successfully deleted."}
  end

  private

    def set_potential_client
      @potential_client = PotentialClient.find(params[:id])
    end

    def potential_client_params
      params.require(:potential_client).permit(:name, :description, :time_spent, :decision,
      :marketing_agent_name, address_attributes: [:number, :street, :city, :province, :country, :postal_code])
    end
end
