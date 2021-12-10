class ServicesController < ApplicationController
  def index
    matching_services = Service.all

    @list_of_services = matching_services.order({ :created_at => :desc })

    render({ :template => "services/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_services = Service.where({ :id => the_id })

    @the_service = matching_services.at(0)

    render({ :template => "services/show.html.erb" })
  end


  # def create
  #   the_spoken_language = SpokenLanguage.new
  #   the_spoken_language.provider_id = @current_provider.id
  #   the_spoken_language.language_id = params.fetch("query_language_id")

  #   if the_spoken_language.valid?
  #     the_spoken_language.save
  #     redirect_to("/provider/#{the_spoken_language.provider_id}/edit", { :notice => "Spoken language created successfully." })
  #   else
  #     redirect_to("/provider/#{the_spoken_language.provider_id}/edit", { :notice => "Spoken language failed to create successfully." })
  #   end
  # end


  def create
    the_service = Service.new
    the_service.need_id = params.fetch("query_need_id")
    the_service.provider_id = @current_provider.id

    if the_service.valid?
      the_service.save
      redirect_to("/provider/#{the_service.provider_id}/edit", { :notice => "Service created successfully." })
    else
      redirect_to("/provider/#{the_service.provider_id}/edit", { :notice => "Service failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_service = Service.where({ :id => the_id }).at(0)

    the_service.need_id = params.fetch("query_need_id")
    the_service.provider_id = params.fetch("query_provider_id")

    if the_service.valid?
      the_service.save
      redirect_to("/services/#{the_service.id}", { :notice => "Service updated successfully."} )
    else
      redirect_to("/services/#{the_service.id}", { :alert => "Service failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_service = Service.where({ :id => the_id }).at(0)

    the_service.destroy

    redirect_to("/provider/#{the_service.provider_id}/edit", { :notice => "Service deleted successfully."} )
  end
end
