require 'rails_helper'
require 'spec_helper'

  describe GithubsController do

    describe "#find_provider" do

      #rachel
      it "figures out that the provider in this case is github" do
        figure = Provider.find_by_user_id(session[13])
        expect figure = "Github"
      end
    end

    describe "#create" do

      #rachel
      it "creates a new github feed in database" do
        expect do
          Feed.create
        end.to change(Feed, :count).by(1)
      end

      #rachel
      it "is a successful redirect" do
        user = User.create
        session[:user_id] = user.id
        post :create
        expect(response.status).to eq(302)
      end

    end

  end
