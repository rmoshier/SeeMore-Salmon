require 'rails_helper'
require 'spec_helper'

  describe InstagramController do
    
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]
    end

    describe "GET 'new'" do
    #calla
      it "is successful" do
        user = User.create
        user.providers.create
        session[:user_id] = user.id

        get :new
        expect(response.status).to eq 200
      end
    end

  describe "#find_provider" do
    #calla
    it "figures out that the provider in this case is instagram" do
      figure = Provider.find_by_user_id(session[13])
      expect figure = "Instagram"
    end
  end

  describe "#search" do
    #calla
    it "takes the variable and inserts it into the API search for instagram" do
      @results = Instagram.client.user_search("Beyonce")
      expect @results = "Beyonce"
    end
  end

  describe "#search" do
    it "equals nil when incorrect inputs are searched" do
      @results = Instagram.client.user_search("//")
      expect @results != '//'

    end
  end

  describe "#create" do
    it "creates a new instance in the feed class" do
        # @feed = Feed.find_by_uid(params[:feed_uid])
        # @feed = 1
    end
  end







end
