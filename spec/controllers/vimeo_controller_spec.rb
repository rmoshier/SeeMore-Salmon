require 'rails_helper'
require 'spec_helper'

  describe VimeoController do
    describe "GET 'new'" do
    # Rebecca
      it "is successful" do
        user = User.create
        session[:user_id] = user.id
        get :new
        expect(response.status).to eq 200
      end
    end

    describe "GET 'search'" do
      it "returns a search result in params" do
        user = User.create
        session[:user_id] = user.id
        get :search, {:search => 'beyonce'}
        expect(@name).to eq 'beyonce'
      end
    end
  end

  # describe VimeoController do
  #   describe "GET 'new'" do
  #   # Rebecca
  #     it "returns successful connection status" do
  #       user = User.create # create a new user object
  #       session[:user_id] = user.id # set the session to this users id
  #       vimeo_object = double("Vimeo", user_media_feed: [])  # this is essentially a stub, the double object here should return a method called user_media_feed with the value of an emtpy array
  #       expect(Vimeo).to receive(:client).and_return(vimeo_object)
  #       provider = Provider.create(service: "vimeo", token: "1234")
  #       user.providers << provider
  #
  #       get :new
  #       expect(response.status).to eq (200)
  #     end
  #   end
  # end

  # describe SessionsController do
  #   describe 'GET create' do
  #     it 'creates a user' do
  #     auth_hash = double("auth_hash", provider: "something")
  #       expect(request).to receive(:env).and_return({"omniauth.auth" => auth_hash})
  #       expect { get :create, provider: "test" }.to change(User, :count).by(1)
  #     end
  #   end
  # end
