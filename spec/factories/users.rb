FactoryGirl.define do
  factory :user do
    name "test user"
    facebook_id 859989470802057
    facebook_token 'Pw7TEZUqn6zrDR3L0xTA36gf990Iz9qe'
    facebook_token_expires_at DateTime.tomorrow.to_time.to_i
  end
end
