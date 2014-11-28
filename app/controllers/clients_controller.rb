class ClientsController < ApplicationController

  before_action :set_client, except:[:index, :create, :new]

  def index
    @clients = Client.all.page(params[:page]).per(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  def show
    respond_to do |format|
      format.js
      format.json { render json: @client }
    end
  end

  def edit
  end

  def new
    @client = Client.new
    @client.build_address
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, flash: {info: 'Client was successfully created.'}
    else
      render action: "new"
    end
  end

  def update
    if @client.update_attributes(client_params)
      redirect_to clients_path, flash: {info: 'Client was successfully updated.'}
    else
      render action: "edit"
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, flash: {info: "Client was successfully deleted."}
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :description, :estimated_delivery_time,
        :delivery_item, address_attributes: [
          :number, :street, :city, :province, :country, :postal_code])
    end
end
