#require 'rubygems'
#require 'sinatra'
#require 'oauth'
#require 'json'
#require 'haml'
#
#enable :sessions
#
#TWITTER_CONSUMER_KEY    = "OfHxEB5Dfp7lDSPRsHD4bg"
#TWITTER_CONSUMER_SECRET = "x9hRfxKtKOOYtpykf3b7hOPiqbiq8ZmnJlZtmAKALQ"
#
#before do
#  @consumer = OAuth::Consumer.new(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET,
#      :site               => "https://api.twitter.com",
#      :scheme             => :header,
#      :http_method        => :post,
#      :request_token_path => "/oauth/request_token",
#      :access_token_path  => "/oauth/access_token",
#      :authorize_path     => "/oauth/authorize")
#end
#
#get '/' do
#  haml :index
#end
#
#post '/login' do
#
#  request_token = @consumer.get_request_token :oauth_callback => auth_url
#
#  session[:request_token]         = request_token.token
#  session[:request_token_secret]  = request_token.secret
#
#  redirect request_token.authorize_url
#
#end
#
#get '/auth' do
#
#  request_token = OAuth::RequestToken.new(
#          @consumer, session[:request_token], session[:request_token_secret]
#  )
#
#  access_token = @consumer.get_access_token(
#          request_token, :oauth_verifier => params[:oauth_verifier]
#  )
#
#  session[:profile] = JSON.parse(
#          access_token.get("/account/verify_credentials.json").body
#  )
#
#  redirect "/profile"
#end
#
#get '/profile' do
#
#  if session[:profile]
#    haml :profile, :locals => {:profile => session[:profile]}
#  else
#    redirect '/'
#  end
#
#end
#
#def auth_url
#  uri       = URI.parse(request.url)
#  uri.path  = '/auth'
#  uri.query = nil
#  uri.to_s
#end
#
#__END__
#
#@@ layout
#%html
# = yield
#
#@@ index
#%form{:action => "/login", :method => "post"}
#  %input{:type => "submit", :value => "Connect with Twitter"}
#
#
#@@ profile
#%img{ :src => "#{profile["profile_image_url"]}", :align => "left"}
#  %p Welcome #{profile["name"]}!
#  %p You are now connected via Twitter
#Don’t forget to replace TWITTER_CON
