class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_provider)
  
  # Uncomment this if you want to force providers to sign in before any other actions
  # before_action(:force_provider_sign_in)
  
  def load_current_provider
    the_id = session[:provider_id]
    @current_provider = Provider.where({ :id => the_id }).first
  end
  
  def force_provider_sign_in
    if @current_provider == nil
      redirect_to("/provider_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
