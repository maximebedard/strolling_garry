require 'rails_helper'

RSpec.describe BranchesController, :type => :controller do


  context "as a user" do

    login_user

    describe "GET #index" do

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

    describe "GET #show" do
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

    describe "GET #edit" do
      it "denies access and the user is redirected to root" do
        branch = create(:branch)
        get :edit, id: branch.id

        access_denied
      end
    end

    describe "PUT #update" do
      it "denies access and the user is redirected to root" do
        branch = create(:branch)
        post :update, id: branch.id
        access_denied
      end
    end


    describe "CREATE #create" do
      it "denies access and the user is redirected to root" do
        post :create, attributes_for(:branch)
        access_denied
      end
    end

    describe "DELETE #destroy" do
      it "denies access and the user is redirected to root" do
        branch = create(:branch)
        delete :destroy, id: branch.id
      end
    end

  end

  context "as an admin" do
    login_admin

    describe "GET #index" do
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

    pending "GET #show"
    pending "GET #edit"
    pending "PUT #update"
    pending "CREATE #create"
    pending "DELETE #destroy"
  end


  def access_denied
    expect(response).to have_http_status(302)
    expect(response).to redirect_to(root_path)
  end

end
