#    require 'rubygems'  
#    require 'sinatra'
#    require 'oauth2'
#    require 'json'
#
#    def client
#      OAuth2::Client.new('201203c9837afb686d2b6b54faea409b', 'ccc96fc215712880b49eb9c04e09ae85', :site => 'https://graph.facebook.com')
#    end
#
#   get '/auth/facebook' do
#     redirect client.web_server.authorize_url(
#       :redirect_uri => redirect_uri,
#        :scope => 'email,offline_access'
#     )
#  end
#
#  get '/auth/facebook/callback' do
#     access_token = client.web_server.get_access_token(params[:code], :redirect_uri => redirect_uri)
#     user = JSON.parse(access_token.get('/me'))
#     p "*************************"
#     p user.inspect
#     p "************************"
#  end
#
#  def redirect_uri
#    uri = URI.parse(request.url)
#    uri.path = '/auth/facebook/callback'
#    uri.query = nil
#    uri.to_s
#  end
