require 'rails_helper'
require 'spec_helper'

  describe InstagramController do
    describe "GET 'new'" do
    #calla
      it "is successful" do
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





end
