require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe SessionsHelper, type: :helper do
  let(:user) {create(:user)}

  describe '#current_user' do
    it 'returns the currently logged in user' do
      current = user
      session[:user_id] = current.id
      expect(helper.current_user).to be_a User
      expect(helper.current_user.id).to be current.id
    end

    it 'returns nil when there is no currently logged in user' do
      expect(helper.current_user).to be_nil
    end
  end

  describe '#login' do
    it 'stores the user in the session hash, making it the current user' do
      current = user
      helper.login(current)
      expect(helper.current_user.id).to be current.id
    end
  end

  describe '#logout' do
    it 'removes the user from the session hash, setting the current user to nil' do
      current = user
      helper.login(current)
      helper.logout
      expect(helper.current_user).to be_nil
    end
  end
end
