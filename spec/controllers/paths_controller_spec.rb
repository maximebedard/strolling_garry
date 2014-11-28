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

  #was the web request successful?
  #was the user redirected to the right page?
  #was the user successfully authenticated?
  #was the correct object stored in the response template?
  #was the appropriate message displayed to the user in the view?

end
