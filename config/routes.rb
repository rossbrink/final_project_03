Rails.application.routes.draw do

  # Routes for the Skill resource:

  # CREATE
  post("/insert_skill", { :controller => "skills", :action => "create" })
          
  # READ
  get("/skills", { :controller => "skills", :action => "index" })
  
  get("/skills/:path_id", { :controller => "skills", :action => "show" })
  
  # UPDATE
  
  post("/modify_skill/:path_id", { :controller => "skills", :action => "update" })
  
  # DELETE
  get("/delete_skill/:path_id", { :controller => "skills", :action => "destroy" })

  #------------------------------

  # Routes for the Task resource:

  # CREATE
  post("/insert_task", { :controller => "tasks", :action => "create" })
          
  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  
  get("/tasks/:path_id", { :controller => "tasks", :action => "show" })
  
  # UPDATE
  
  post("/modify_task/:path_id", { :controller => "tasks", :action => "update" })
  
  # DELETE
  get("/delete_task/:path_id", { :controller => "tasks", :action => "destroy" })

  #------------------------------

  # Routes for the Area resource:

  # CREATE
  post("/insert_area", { :controller => "areas", :action => "create" })
          
  # READ
  get("/areas", { :controller => "areas", :action => "index" })
  
  get("/areas/:path_id", { :controller => "areas", :action => "show" })
  
  # UPDATE
  
  post("/modify_area/:path_id", { :controller => "areas", :action => "update" })
  
  # DELETE
  get("/delete_area/:path_id", { :controller => "areas", :action => "destroy" })

  #------------------------------

  # Routes for the Neighborhood resource:

  # CREATE
  post("/insert_neighborhood", { :controller => "neighborhoods", :action => "create" })
          
  # READ
  get("/neighborhoods", { :controller => "neighborhoods", :action => "index" })
  
  get("/neighborhoods/:path_id", { :controller => "neighborhoods", :action => "show" })
  
  # UPDATE
  
  post("/modify_neighborhood/:path_id", { :controller => "neighborhoods", :action => "update" })
  
  # DELETE
  get("/delete_neighborhood/:path_id", { :controller => "neighborhoods", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })
          
  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  #------------------------------

  # Routes for the Service resource:

  # CREATE
  post("/insert_service", { :controller => "services", :action => "create" })
          
  # READ
  get("/services", { :controller => "services", :action => "index" })
  
  get("/services/:path_id", { :controller => "services", :action => "show" })
  
  # UPDATE
  
  post("/modify_service/:path_id", { :controller => "services", :action => "update" })
  
  # DELETE
  get("/delete_service/:path_id", { :controller => "services", :action => "destroy" })

  #------------------------------

  # Routes for the Need resource:

  # CREATE
  post("/insert_need", { :controller => "needs", :action => "create" })
          
  # READ
  get("/needs", { :controller => "needs", :action => "index" })
  
  get("/needs/:path_id", { :controller => "needs", :action => "show" })
  
  # UPDATE
  
  post("/modify_need/:path_id", { :controller => "needs", :action => "update" })
  
  # DELETE
  get("/delete_need/:path_id", { :controller => "needs", :action => "destroy" })

  #------------------------------

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

    # SIGN IN FORM TO EMAIL
    get("/user_sign_in_to_email", { :controller => "user_authentication", :action => "sign_in_form_to_email" })

  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

   # AUTHENTICATE AND STORE COOKIE TO EMAIL
   post("/user_verify_credentials_to_email", { :controller => "user_authentication", :action => "create_cookie_to_email" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # USER PROFILE
  get("/user/:path_id", { :controller => "user", :action => "profile"})

  # USER EDIT PROFILE
  get("/user/:path_id/edit", { :controller => "user", :action => "profile_edit"})


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

  # HOMEPAGE
  get("/", { :controller => "provider", :action =>"index"})

  # PROVIDER PROFILE
  get("/provider/:path_id", { :controller => "provider", :action => "profile"})

  # PROVIDER EDIT PROFILE
  get("/provider/:path_id/edit", { :controller => "provider", :action => "profile_edit"})

  # ALL SIGN IN SPLITTER
  get("/sign_in_split", { :controller => "application", :action => "sign_in_split"})
  
end
