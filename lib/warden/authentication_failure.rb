class Warden::AuthenticationFailureApp < Devise::FailureApp

  # We have a failed login attempt, perhaps it's a Google login with a new user that must be created
  def respond
    # HACK: We set @scope to user here to make devise happy
    @scope = :user
    
    # Do we have a Google Access token?
    if access_token = (((env['warden.options'] || {})[:oauth] || {})[:google] || {})[:access_token]

      # Get email of authenticated user
      authenticated_email = ActiveSupport::JSON.decode(access_token.get('https://www.googleapis.com/userinfo/email?alt=json').body)['data']['email']
      
        # Find or create user
        user = User.find_or_create_by_email(authenticated_email)
      
        # Sign in the user and redirect
        env['warden'].set_user(user)
        redirect_to root_path
      else
        super
      end
    else
      super
    end
  end

end