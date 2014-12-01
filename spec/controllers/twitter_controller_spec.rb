require 'rails_helper'
require 'spec_helper'

RSpec.describe TwitterController, :type => :controller do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  describe "GET #new" do
    it "renders the :new template" do

      user = User.create
      user.providers.create
      session[:user_id] = user.id

      get :new
      expect(response).to render_template(:new)
    end

    it "returns an error for unauthenticated users" do
      get :new
      expect(response).to eq 404 # redirect to root (301? 304?)
      # expect response to redirect to PATH
    end
  end

  describe "GET #show" do

    it "renders the :show template" do
      get :show
      expect(response).to render_template(:show)
    end

    it "returns an error for unauthenticated users" do
      get :show
      expect(response).to eq 404
    end

  end
end
