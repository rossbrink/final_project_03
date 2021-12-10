class ProviderAuthenticationController < ApplicationController
  # Uncomment this if you want to force providers to sign in before any other actions
  # skip_before_action(:force_provider_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })
  skip_before_action(:force_all_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "provider_authentication/sign_in.html.erb" })
  end

  def create_cookie
    provider = Provider.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if provider != nil
      are_they_legit = provider.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/provider_sign_in", { :alert => "Incorrect password." })
      else
        session[:provider_id] = provider.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/provider_sign_in", { :alert => "No provider with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "provider_authentication/sign_up.html.erb" })
  end

  def create
    @provider = Provider.new
    @provider.email = params.fetch("query_email")
    @provider.password = params.fetch("query_password")
    @provider.password_confirmation = params.fetch("query_password_confirmation")
    @provider.first_name = params.fetch("query_first_name")
    @provider.last_name = params.fetch("query_last_name")
    @provider.price = params.fetch("query_price")

    if params.has_key?(:image)
      @provider.image = params.fetch(:image)
    else
    end

    @provider.description = params.fetch("query_description")

    save_status = @provider.save

    if save_status == true
      session[:provider_id] = @provider.id
   
      redirect_to("/provider/#{@provider.id}", { :notice => "Provider account created successfully."})
    else
      redirect_to("/provider_sign_up", { :alert => "Provider account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "provider_authentication/edit_profile.html.erb" })
  end

  def update
    @provider = @current_provider
    @provider.email = params.fetch("query_email")
    @provider.password = params.fetch("query_password")
    @provider.password_confirmation = params.fetch("query_password_confirmation")
    @provider.first_name = params.fetch("query_first_name")
    @provider.last_name = params.fetch("query_last_name")
    @provider.price = params.fetch("query_price")
    # @provider.image = params.fetch(:image)

    if params.has_key?(:image)
      @provider.image = params.fetch(:image)
    else
    end

    # if params.fetch(:image) != nil
    #   @provider.image = params.fetch(:image)
    # else
    # end

    @provider.description = params.fetch("query_description")
    # @provider.reviews_count = params.fetch("query_reviews_count")
    # @provider.spoken_languages_count = params.fetch("query_spoken_languages_count")
    # @provider.services_count = params.fetch("query_services_count")
    
    if @provider.valid?
      @provider.save

      redirect_to("/provider/#{@current_provider.id}/edit", { :notice => "Provider account updated successfully."})
    else
      redirect_to("/provider/#{@current_provider.id}/edit", { :alert => "Provider account NOT updated successfully."})
    end
  end

  def destroy
    @current_provider.destroy
    reset_session
    
    redirect_to("/", { :notice => "Provider account cancelled" })
  end
 
end
