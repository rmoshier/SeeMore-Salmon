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







end
