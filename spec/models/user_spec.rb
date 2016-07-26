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

  describe '::from_omniauth' do
    auth_hash = {
        'uid' => 859989470802057,
        'info' => {'name' => 'tester'},
        'credentials'=> {
          'token' => '5D9713DAC628A9A64EF8929EF9ED2',
          'expires_at' => DateTime.tomorrow.to_time.to_i
        }
      }
    let(:user_from_omniauth) {User.from_omniauth(auth_hash)}

    context 'when user does not exist in database yet' do
      it 'creates a user if there is no user with the given facebook_id' do
        user_from_hash = user_from_omniauth
        expect(user).to be_a User
      end
    end

    context 'when user already exists in database' do
      it 'returns the user with the given facebook_id if it exists' do
        existing_user = user
        expect(user_from_omniauth.id).to be existing_user.id
      end

      it 'updates the name, facebook_token, and facebook_token_expires_at fields' do
        existing_user = user
        user_from_hash = user_from_omniauth
        existing_user.reload
        expect(existing_user.name).to eq user_from_omniauth.name
        expect(existing_user.facebook_token).to eq user_from_hash.facebook_token
        expect(existing_user.facebook_token_expires_at).to eq user_from_hash.facebook_token_expires_at
      end
    end
  end
end
