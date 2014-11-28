require 'rails_helper'

RSpec.describe BranchesController, :type => :controller do


  describe "GET #index" do

    describe "as user" do
      login_user

      it "responds HTTP 302 status code and redirect to root" do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    describe "as admin" do
      login_admin

      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template('index')
      end

      pending "loads all of the branches into @branches"
    end

  end

  describe "GET #show" do

    describe "as user" do
      login_user

      it "responds HTTP 302 status code and redirect to root" do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    describe "as admin" do
      login_admin

      it "responds with the corresponding @branch json" do
        branch = create(:branch)
        get :show, format: :json, id: branch.id

        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['id']).to eq(branch.id)
      end

      it "responds with an HTTP 200 and rendering the show.js.erb view" do
        branch = create(:branch)
        xhr :get, :show, format: :js, id: branch.id

        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template('show')
      end

    end

  end

  describe "GET #edit" do

    describe "as user" do

    end

    describe "as admin" do

    end

  end

  describe "POST #create" do

    describe "as user" do

    end

    describe "as admin" do

    end

  end

  describe "PUT #update" do
    describe "as user" do

    end

    describe "as admin" do

    end

  end

  describe "DELETE #destroy" do
    describe "as user" do

    end

    describe "as admin" do

    end
    
  end

end
