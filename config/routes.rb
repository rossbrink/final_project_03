Rails.application.routes.draw do



  # Routes for the Spoken language resource:

  # CREATE
  post("/insert_spoken_language", { :controller => "spoken_languages", :action => "create" })
          
  # READ
  get("/spoken_languages", { :controller => "spoken_languages", :action => "index" })
  
  get("/spoken_languages/:path_id", { :controller => "spoken_languages", :action => "show" })
  
  # UPDATE
  
  post("/modify_spoken_language/:path_id", { :controller => "spoken_languages", :action => "update" })
  
  # DELETE
  get("/delete_spoken_language/:path_id", { :controller => "spoken_languages", :action => "destroy" })

  #------------------------------

  # Routes for the Language resource:

  # CREATE
  post("/insert_language", { :controller => "languages", :action => "create" })
          
  # READ
  get("/languages", { :controller => "languages", :action => "index" })
  
  get("/languages/:path_id", { :controller => "languages", :action => "show" })
  
  # UPDATE
  
  post("/modify_language/:path_id", { :controller => "languages", :action => "update" })
  
  # DELETE
  get("/delete_language/:path_id", { :controller => "languages", :action => "destroy" })

  #------------------------------

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
