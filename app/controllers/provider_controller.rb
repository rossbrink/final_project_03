class ProviderController < ApplicationController
  def index
    render({ :template => "provider/index.html.erb"})
  end
end
