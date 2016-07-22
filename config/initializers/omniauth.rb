Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_app_id'], ENV['facebook_secret'],
    scope: 'user_posts,user_friends,user_location'
    # TODO
    # display: 'popup'
end
