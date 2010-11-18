Millap::Application.routes.draw do
  
  get "fieldpartner/new"

  get "fieldpartner/create"

  controller :fieldpartner do
    get 'fp/new', :to => :new, :as => :new
    post 'fp/create', :to => :create, :as => :create
  end  

  #devise_for :users, :path => "users", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'signup' }

 devise_for :users, :path => "users", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'signup' }, :controllers => { :registrations => "registrations", :confirmations => :confirmations }


devise_for :users do
   get "/signup", :to => "registrations#new" # Add a Custom Route for Registrations
end



 # devise_for :users do
 #   get "login", :to => "devise/sessions#new"
    #get "logout", :to => "devise/sessions#sign_out"
    #get "sign-up", :to => "devise/registrations#new"
#  end




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"
 
  





  resources :invitations, :only => [:new, :create] do
     collection do
       get :authorize     
       post :get_invitation_token
       get :get_invitation_token
     end	    
   end

   
  controller :home do
    match 'about-milaap', :to => :about, :as => :about
    match 'how-it-works', :to => :how_it_work, :as => :how_it_work
    match 'get-involved', :to => :get_envolved, :as => :get_envolved
    match 'contact-us', :to => :contact_us, :as => :contact_us
    match 'advisory-board', :to => :advisory_board, :as => :advisory_board
    match 'team', :to => :team, :as => :team
    match 'volunteer', :to => :volunteer, :as => :volunteer
    match 'terms', :to => :terms, :as => :terms
    match 'jobs', :to => :jobs, :as => :jobs
    match 'privacy', :to => :privacy, :as => :privacy
    match 'view-all-projects', :to => :view_all_projects, :as => :view_all_projects
    match 'borrower-profile/:id/:name', :to => :borrower_profile, :as => :borrower_profile,:id=>/\d+/,:name=>/.*/
    match 'lender-profile', :to => :lender_profile, :as => :lender_profile
    match 'lend-money-to-borrower', :to => :lend_money_to_borrower, :as => :lend_money_to_borrower
    match 'who-we-are', :to => :who_we_are, :as => :who_we_are
    match 'verify-invitation-code', :to => :verify_invitation_code, :as => :verify_invitation_code
    match 'alpha', :to => :alpha_home, :as => :alpha_home
    match 'thanks', :to => :thank_you, :as => :thank_you
    match 'why-milaap', :to => :why_milaap, :as => :why_milaap
    match 'test', :to => :test, :as => :test
    match 'pledge-a-loan', :to => :pledge, :as => :pledge
    match 'edit-account', :to => :edit_user_account, :as => :edit_user_account
     match 'save-email-info', :to => :save_email_info, :as => :save_email_info
    get 'welcome', :to => :welcome, :as => :welcome
  end



  #controller :twitt_oauth do
   # get 'twitter-login', :to => :twitter_login, :as => :twitter_login
    #get 'twitter-callback', :to => :twitter_callback, :as => :twitter_callback
    #get 'twitter-profile', :to => :profile, :as => :profile
   # get 'twit-profile-callback', :to => :twit_callback, :as => :twit_callback
 #end 





 
  controller :paypal do
    get 'paypal-ipn', :to => :ipn, :as => :ipn
  end 

  controller :pay_tm do
    get 'paytm-ipn', :to => :ipn, :as => :ipn
  end


  controller :admin do
   match 'admin', :to => "Admin::Admin#index", :path => "Admin::Admin#index"
  end 

 controller :twitt_oauth do
    get 'twitter-login', :to => :twitter_login, :as => :twitter_login
    get 'twitter-callback', :to => :twitter_callback, :as => :twitter_callback
  end 

  controller :google_outh do
    get 'google-login', :to => :google_login, :as => :google_login
    get 'google-callback', :to => :google_callback, :as => :google_callback
  end 


 controller :facebook do
    get 'facebook-login', :to => :facebook_login, :as => :facebook_login
    get 'facebook-callback', :to => :facebook_call, :as => :facebook_call
  end



 #controller :facebook do
 #   get 'facebook-login', :to => :facebook_login, :as => :facebook_login
  #  get 'facebook-callback', :to => :facebook_callback, :as => :facebook_callback
# end 


 #namespace :admin do
 #  resources :admin do
 # end 
 # resources :invitations# do
 #end
#end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
