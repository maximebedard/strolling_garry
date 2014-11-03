class Api::ClientsController < ApplicationController

  def index
    render json: Client.all
  end

  def show
    render json: Client.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])

    if @client.save
      render json:@client, status: :created
    else
      render json:@client.errors, status: :unprocessable_entity
    end

  end

  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(params[:client])
      head :no_content
    else
      render json:@client.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    head :no_content
  end


end
