Rails.application.routes.draw do



  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Provider account:

  # SIGN UP FORM
  get("/provider_sign_up", { :controller => "provider_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_provider", { :controller => "provider_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_provider_profile", { :controller => "provider_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_provider", { :controller => "provider_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_provider_account", { :controller => "provider_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/provider_sign_in", { :controller => "provider_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/provider_verify_credentials", { :controller => "provider_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/provider_sign_out", { :controller => "provider_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
