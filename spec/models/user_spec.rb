require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_instance) {build(:user)}
  let(:user) {create(:user)}

  it 'requires a name' do
    expect(user_instance).to be_valid
    user_instance.name = ""
    expect(user_instance).to be_invalid
  end
end
