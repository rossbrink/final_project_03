class PaymentAcceptedsController < ApplicationController
  def index
    matching_payment_accepteds = PaymentAccepted.all

    @list_of_payment_accepteds = matching_payment_accepteds.order({ :created_at => :desc })

    render({ :template => "payment_accepteds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_payment_accepteds = PaymentAccepted.where({ :id => the_id })

    @the_payment_accepted = matching_payment_accepteds.at(0)

    render({ :template => "payment_accepteds/show.html.erb" })
  end

  def create
    the_payment_accepted = PaymentAccepted.new
    the_payment_accepted.payment_type_id = params.fetch("query_payment_type_id")
    the_payment_accepted.provider_id = @current_provider.id

    if the_payment_accepted.valid?
      the_payment_accepted.save
      redirect_to("/provider/#{the_payment_accepted.provider_id}/edit", { :notice => "Payment accepted created successfully." })
    else
      redirect_to("/provider/#{the_payment_accepted.provider_id}/edit", { :notice => "Payment accepted failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_payment_accepted = PaymentAccepted.where({ :id => the_id }).at(0)

    the_payment_accepted.payment_type_id = params.fetch("query_payment_type_id")
    the_payment_accepted.provider_id = params.fetch("query_provider_id")

    if the_payment_accepted.valid?
      the_payment_accepted.save
      redirect_to("/payment_accepteds/#{the_payment_accepted.id}", { :notice => "Payment accepted updated successfully."} )
    else
      redirect_to("/payment_accepteds/#{the_payment_accepted.id}", { :alert => "Payment accepted failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_payment_accepted = PaymentAccepted.where({ :id => the_id }).at(0)

    the_payment_accepted.destroy

    redirect_to("/provider/#{the_payment_accepted.provider_id}/edit", { :notice => "Payment accepted deleted successfully."} )
  end
end
