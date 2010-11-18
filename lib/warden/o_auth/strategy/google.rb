class Warden::OAuth::Strategy::Google < Warden::OAuth::Strategy

  # Override request token, passing in the scopes we need, in this case the email of the authenticated user
  # http://code.google.com/intl/da/apis/accounts/docs/OAuth_ref.html#RequestToken
  # http://code.google.com/intl/da/apis/apps/profiles/developers_guide_protocol.html
  # http://code.google.com/intl/da/apis/gdata/faq.html#AuthScopes
  def request_token
    host_with_port = Warden::OAuth::Utils.host_with_port(request)
    @request_token ||= consumer.get_request_token({:oauth_callback => host_with_port}, {:scope => "https://www.googleapis.com/auth/userinfo#email"})
  end
  
end