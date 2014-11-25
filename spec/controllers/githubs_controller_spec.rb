require 'rails_helper'
require 'spec_helper'

RSpec.describe GithubsController, :type => :controller do

    describe GithubsController do
      describe "GET 'new'" do
      #rachel
        it "is successful" do
          get :new
          expect(response.status).to eq 200
        end
      end

    describe "#find_provider" do
      #rachel
      it "figures out that the provider in this case is github" do
        figure = Provider.find_by_user_id(session[13])
        expect figure = "Github"
      end
    end

    # describe "#search" do
    #   #rachel
    #   it "takes the variable and inserts it into the API search for github" do
    #     @results = Github.client.user_search("Bookis")
    #     expect @results = "Bookis"
    #   end
    # end

  end
end
