require 'rails_helper'
require 'spec_helper.rb'

RSpec.describe "home/index.html.erb", :type => :view do

  # kristen
  it "renders _guest_index partial for guests" do
    session[:user_id] = nil
    render
    expect(view).to render_template(:partial => "_guest_index")
  end

  # kristen
  # is it a problem that this test passes without Oauth?
  it "renders _signed_in_index partial for guests" do
    session[:user_id] = User.create
    render
    expect(view).to render_template(:partial => "_signed_in_index")
  end
end
