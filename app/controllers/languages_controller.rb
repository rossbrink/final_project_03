class LanguagesController < ApplicationController
  def index
    matching_languages = Language.all

    @list_of_languages = matching_languages.order({ :created_at => :desc })

    render({ :template => "languages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_languages = Language.where({ :id => the_id })

    @the_language = matching_languages.at(0)

    render({ :template => "languages/show.html.erb" })
  end

  def create
    the_language = Language.new
    the_language.name = params.fetch("query_name")
    the_language.spoken_languages_count = params.fetch("query_spoken_languages_count")

    if the_language.valid?
      the_language.save
      redirect_to("/languages", { :notice => "Language created successfully." })
    else
      redirect_to("/languages", { :notice => "Language failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_language = Language.where({ :id => the_id }).at(0)

    the_language.name = params.fetch("query_name")
    the_language.spoken_languages_count = params.fetch("query_spoken_languages_count")

    if the_language.valid?
      the_language.save
      redirect_to("/languages/#{the_language.id}", { :notice => "Language updated successfully."} )
    else
      redirect_to("/languages/#{the_language.id}", { :alert => "Language failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_language = Language.where({ :id => the_id }).at(0)

    the_language.destroy

    redirect_to("/languages", { :notice => "Language deleted successfully."} )
  end

  def add_language
    params[:language_ids]
  end
end
