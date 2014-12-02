require 'rails_helper'
require 'spec_helper'

RSpec.describe TwitterController, :type => :controller do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  # kristen
  describe "GET #new" do
    it "renders the :new template" do

      user = User.create
      user.providers.create(name: "twitter")
      session[:user_id] = user.id

      get :new
      expect(response).to render_template(:new)
    end

    # kristen
    it "redirects unauthenticated users" do
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #show" do
    # it "renders the :show template" do
    #
    #   client = double("Twitter::REST::Client")
    #   user = User.create
    #   user.providers.create
    #   session[:user_id] = user.id
    #
    #   Twitter.stub!(:configure).and_return true
    #   Twitter::Client.stub!(:new).and_return(client)
    #   client.stub!(:current_user).and_return(user)
    #
    #   get :show
    #   expect(response).to render_template(:show)
    # end

    # kristen
    it "redirects unauthenticated users" do
      get :show
      expect(response).to redirect_to(root_path)
    end
  end
end
