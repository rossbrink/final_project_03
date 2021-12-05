class UserController < ApplicationController
  def index
    matching_user = User.all
    @list_of_users = matching_users.order({ :created_at => :desc })
    render({ :template => "user/index.html.erb"})
  end

  def profile
    the_user_id = params.fetch("path_id")
    @the_user = User.where(:id => the_user_id).at(0)

    render({ :template => "user/profile.html.erb"})
  end

  def user_edit
    the_user_id = @current_user
    @the_user = User.where(:id => the_user_id).at(0)

    render({ :template => "user/profile_edit.html.erb"})
  end
end