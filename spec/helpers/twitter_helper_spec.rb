require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GithubsHelper. For example:
#
# describe GithubsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TwitterHelper, :type => :helper do

  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    :provider => 'twitter',
    :uid => '123545'
    # etc.
  })

end
