class AreasController < ApplicationController
  def index
    matching_areas = Area.all

    @list_of_areas = matching_areas.order({ :created_at => :desc })

    render({ :template => "areas/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_areas = Area.where({ :id => the_id })

    @the_area = matching_areas.at(0)

    render({ :template => "areas/show.html.erb" })
  end

  def create
    the_area = Area.new
    the_area.neighborhood_id = params.fetch("query_neighborhood_id")
    the_area.provider_id = params.fetch("query_provider_id")

    if the_area.valid?
      the_area.save
      redirect_to("/areas", { :notice => "Area created successfully." })
    else
      redirect_to("/areas", { :notice => "Area failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_area = Area.where({ :id => the_id }).at(0)

    the_area.neighborhood_id = params.fetch("query_neighborhood_id")
    the_area.provider_id = params.fetch("query_provider_id")

    if the_area.valid?
      the_area.save
      redirect_to("/areas/#{the_area.id}", { :notice => "Area updated successfully."} )
    else
      redirect_to("/areas/#{the_area.id}", { :alert => "Area failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_area = Area.where({ :id => the_id }).at(0)

    the_area.destroy

    redirect_to("/areas", { :notice => "Area deleted successfully."} )
  end
end
