require 'rails_helper'

RSpec.describe PathsController, :type => :controller do

  describe "GET #index" do
    login_user
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end

    pending "loads all of the paths into @paths"

  end

  describe "GET #potential_clients" do
    login_user

    pending "reponds successfully with an HTTP 200 status code"

    pending "render the path's potential clients"

  end

  describe "GET #map" do
    login_user


    pending "reponds successfully with an HTTP 200 status code"

    pending "render the map.html.erb"

    pending "pass the @path"



  end

  describe "GET #reports" do
    login_user


  end

  describe "GET #index" do
    login_user


  end

  describe "GET #create" do
    login_user


  end

  describe "GET #new" do
    login_user


  end

  describe "GET #edit" do
    login_user


  end

  describe "GET #show" do
    login_user


  end

  describe "GET #update" do
    login_user


  end

  describe "GET #update" do
    login_user


  end

  describe "GET #destroy" do
    login_user


  end

end
