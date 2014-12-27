require 'flickraw'

FlickRaw.api_key = ENV['FLICKR_API_KEY']
FlickRaw.shared_secret = ENV['FLICKR_SECRET']

unless ENV['OAUTH_TOKEN_SECRET'] && ENV['OAUTH_TOKEN']
  token = flickr.get_request_token
  auth_url = flickr.get_authorize_url(token['oauth_token'], perms: 'delete')
  puts auth_url
  puts "Log in and copy-paste the verification token"
  verify = gets.strip
  flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  puts "Access Token: #{token['oauth_token']}"
else
  flickr.access_token = ENV['OAUTH_TOKEN']
  flickr.access_secret = ENV['OAUTH_TOKEN_SECRET']
end

login = flickr.test.login
puts "Loggein as #{login.username}"
