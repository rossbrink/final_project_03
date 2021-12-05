class ProviderController < ApplicationController
  def index
    @q = Provider.ransack(params[:q])
    @providers = @q.result
    
    matching_providers = Provider.all
    @list_of_providers = matching_providers.order({ :created_at => :desc })
    render({ :template => "provider/index.html.erb"})

  end

  def profile
    the_provider_id = params.fetch("path_id")
    @the_provider = Provider.where(:id => the_provider_id).at(0)

    render({ :template => "provider/profile.html.erb"})
  end

  def profile_edit
    the_provider_id = @current_provider
    @the_provider = Provider.where(:id => the_provider_id).at(0)
    # the_matching_languages = the_provider.spoken_languages
    # a_spoken_language = the_matching_languages.at(0)
    # @a_language = a_spoken_language.language

    render({ :template => "provider/profile_edit.html.erb"})
  end
end
