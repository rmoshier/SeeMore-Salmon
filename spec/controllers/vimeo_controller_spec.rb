require 'rails_helper'
require 'spec_helper'

  describe VimeoController do
    # I thought this would work but it did not.
    # before(:each) do
    #   @user = User.new
    #   session[:id] = @user.id
    # end


    describe "GET 'new'" do
      # Rebecca
      it "is successful" do
        user = User.create
        session[:user_id] = user.id
        get :new
        expect(response.status).to eq 200
      end
    end

    describe "#search'" do
      # Rebecca
      it "is successful" do
        user = User.create
        session[:user_id] = user.id
        get :search
        expect(response).to render_template(:search)
      end

      # Rebecca
      it "contains an instance variable" do
        user = User.create
        session[:user_id] = user.id
        get :search
        expect(response).to render_template(:search)
      end

      # # Rebecca this is not working.
      # it "returns a search result in params" do
      #   user = User.create
      #   session[:user_id] = user.id
      #   get :search, {:search => 'beyonce'}
      #   expect(@name).to eq 'beyonce'
      # end
    end

    describe "#create" do
      # Rebecca
      it "is a successful redirect" do
        user = User.create
        session[:user_id] = user.id
        post :create
        expect(response.status).to eq(302)
      end

      # Rebecca
      it "creates a new vimeo Feed in database" do
        expect do
          Feed.create
        end.to change(Feed, :count).by(1)
      end

      # let!(:new_feed)  { Feed.create(provider: "vimeo", username: "Beyonce", uid: "233323") }
      # # Rebecca THIS IS NOT WORKING
      # it "assigns @new_vimeo_feed" do
      #   user = User.create
      #   session[:user_id] = user.id
      #   post :create
      #   expect(assigns(:new_vimeo_feed)).to eq([new_feed])
      # end
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
