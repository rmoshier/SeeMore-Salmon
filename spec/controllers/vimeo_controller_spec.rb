require 'rails_helper'
require 'spec_helper'

  describe VimeoController do
    describe "GET 'new'" do
    # Rebecca
      it "returns successful connection status" do
        GET :new
        expect(response.status).to eq(200)
      end
    end
  end
