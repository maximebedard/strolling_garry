class ClientsController < ApplicationController
  def index
    @clients = Client.all.page(params[:page]).per(15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  def edit
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @client }
    end
  end

  def new
    @client = Client.new
    @client.build_address

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :description, :estimated_delivery_time,
        :delivery_item, address_attributes: [
          :number, :street, :city, :province, :country, :postal_code])
    end
end
