class ConfirmationsController < Devise::ConfirmationsController
prepend_view_path "app/views/devise"
# GET /resource/confirmation/new
  def new
    build_resource({})
    render_with_scope :new
  end

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions
      redirect_to new_session_path(resource_name)
    else
      render_with_scope :new
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  #def show
   # self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    #if resource.errors.empty?
     # set_flash_message :notice, :confirmed
      #sign_in_and_redirect(resource_name, resource)
    #else
     # render_with_scope :new
    #end
  #end
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    if resource.errors.empty?
      #set_flash_message :notice, :confirmed 
      MilaapMailer.welcome_email(resource).deliver
      sign_in(resource_name, resource)
      redirect_to welcome_url
    else
      render_with_scope :new
     end
  end

  

end