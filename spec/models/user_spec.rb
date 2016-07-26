require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_instance) {build(:user)}
  let(:user) {create(:user)}

  it 'requires a name' do
    expect(user_instance).to be_valid
    user_instance.name = nil
    expect(user_instance).to be_invalid
    user_instance.name = ""
    expect(user_instance).to be_invalid
  end

  it 'requires a facebook_id' do
    user_instance.facebook_id = nil
    expect(user_instance).to be_invalid
  end

  it 'accepts very large numbers for facebook_id' do
    user_instance.facebook_id = 859989470802057
    expect(user_instance).to be_valid
  end
end
