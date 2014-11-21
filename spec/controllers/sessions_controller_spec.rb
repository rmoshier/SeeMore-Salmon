require 'rails_helper'
require 'spec_helper'

describe SessionsController do
  describe "#destroy" do
    it "successfully logs out a user" do
      session[:uid].should be_nil
    end
  end
end
