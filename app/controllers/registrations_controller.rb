class RegistrationsController < Devise::RegistrationsController
 prepend_view_path "app/views/devise"
 layout  'application'

 #layout 'borrower'


 #~ prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  #~ prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  #~ include Devise::Controllers::InternalHelpers

  # GET /resource/sign_up
  def new
    p "*******"	  
    p cookies[:loan_pledged] 
    p "*******"
    build_resource({})
    render_with_scope :new
  end

  # POST /resource/sign_up
  def create
    build_resource
    resource.first_name = params[:user][:first_name]
    resource.last_name = params[:user][:last_name]
     if resource.save
	    
      #set_flash_message :notice, :signed_up
      #MilaapMailer.welcome_email(resource).deliver
      # sign_in_and_redirect
  
      #sign_in(resource_name, resource)
      #redirect_to  thank_you_url
      #sign_in_and_redirect(resource_name, resource)
      session[:correct_invitation_token] = nil
      #set_flash_message :notice, :signed_up if signed_in?(resource_name)
      flash[:notice] = "Thank you for signing up with Milaap! Check your email for a message from us, and click the link you find inside it to confirm your email address."
      sign_out_and_redirect(resource_name)
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  # GET /resource/edit
  def edit
    render_with_scope :edit
  end

  # PUT /resource
  def update
    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    set_flash_message :notice, :destroyed
    sign_out_and_redirect(self.resource)
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now.
  def cancel
    expire_session_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end

  protected

    # Build a devise resource passing in the session. Useful to move
    # temporary session data to the newly created user.
    def build_resource(hash=nil)
      hash ||= params[resource_name] || {}
      self.resource = resource_class.new_with_session(hash, session)
    end

    # Authenticates the current scope and gets a copy of the current resource.
    # We need to use a copy because we don't want actions like update changing
    # the current user in place.
    def authenticate_scope!
      send(:"authenticate_#{resource_name}!")
      self.resource = resource_class.find(send(:"current_#{resource_name}").id)
    end
end
