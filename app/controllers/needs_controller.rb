class NeedsController < ApplicationController
  def index
    matching_needs = Need.all

    @list_of_needs = matching_needs.order({ :created_at => :desc })

    render({ :template => "needs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_needs = Need.where({ :id => the_id })

    @the_need = matching_needs.at(0)

    render({ :template => "needs/show.html.erb" })
  end

  def create
    the_need = Need.new
    the_need.name = params.fetch("query_name")
    the_need.description = params.fetch("query_description")
    the_need.services_count = params.fetch("query_services_count")

    if the_need.valid?
      the_need.save
      redirect_to("/needs", { :notice => "Need created successfully." })
    else
      redirect_to("/needs", { :notice => "Need failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_need = Need.where({ :id => the_id }).at(0)

    the_need.name = params.fetch("query_name")
    the_need.description = params.fetch("query_description")
    the_need.services_count = params.fetch("query_services_count")

    if the_need.valid?
      the_need.save
      redirect_to("/needs/#{the_need.id}", { :notice => "Need updated successfully."} )
    else
      redirect_to("/needs/#{the_need.id}", { :alert => "Need failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_need = Need.where({ :id => the_id }).at(0)

    the_need.destroy

    redirect_to("/needs", { :notice => "Need deleted successfully."} )
  end
end
