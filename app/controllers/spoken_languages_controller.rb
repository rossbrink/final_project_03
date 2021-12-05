class SpokenLanguagesController < ApplicationController
  def index
    matching_spoken_languages = SpokenLanguage.all

    @list_of_spoken_languages = matching_spoken_languages.order({ :created_at => :desc })

    render({ :template => "spoken_languages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_spoken_languages = SpokenLanguage.where({ :id => the_id })

    @the_spoken_language = matching_spoken_languages.at(0)

    render({ :template => "spoken_languages/show.html.erb" })
  end

  def create
    the_spoken_language = SpokenLanguage.new
    the_spoken_language.provider_id = @current_provider.id
    the_spoken_language.language_id = params.fetch("query_language_id")

    if the_spoken_language.valid?
      the_spoken_language.save
      redirect_to("/provider/#{the_spoken_language.provider_id}/edit", { :notice => "Spoken language created successfully." })
    else
      redirect_to("/provider/#{the_spoken_language.provider_id}/edit", { :notice => "Spoken language failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_spoken_language = SpokenLanguage.where({ :id => the_id }).at(0)

    the_spoken_language.provider_id = params.fetch("query_provider_id")
    the_spoken_language.language_id = params.fetch("query_language_id")

    if the_spoken_language.valid?
      the_spoken_language.save
      redirect_to("/spoken_languages/#{the_spoken_language.id}", { :notice => "Spoken language updated successfully."} )
    else
      redirect_to("/spoken_languages/#{the_spoken_language.id}", { :alert => "Spoken language failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_spoken_language = SpokenLanguage.where({ :id => the_id }).at(0)

    the_spoken_language.destroy

    redirect_to("/provider/#{the_spoken_language.provider_id}/edit", { :notice => "Spoken language deleted successfully."} )
  end
end
