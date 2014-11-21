require 'rails_helper'
require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
      # giving it the name of the action we're trying to test
    end
  end

  # describe 'GET "show"' do
  #   it 'is successful' do
  #     get :show, id: 1
  #     expect(response.status).to eq 200
  #   end
  # end
end
