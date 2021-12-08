class PaymentTypesController < ApplicationController
  def index
    matching_payment_types = PaymentType.all

    @list_of_payment_types = matching_payment_types.order({ :created_at => :desc })

    render({ :template => "payment_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_payment_types = PaymentType.where({ :id => the_id })

    @the_payment_type = matching_payment_types.at(0)

    render({ :template => "payment_types/show.html.erb" })
  end

  def create
    the_payment_type = PaymentType.new
    the_payment_type.name = params.fetch("query_name")
    the_payment_type.url = params.fetch("query_url")

    if the_payment_type.valid?
      the_payment_type.save
      redirect_to("/payment_types", { :notice => "Payment type created successfully." })
    else
      redirect_to("/payment_types", { :notice => "Payment type failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_payment_type = PaymentType.where({ :id => the_id }).at(0)

    the_payment_type.name = params.fetch("query_name")
    the_payment_type.url = params.fetch("query_url")

    if the_payment_type.valid?
      the_payment_type.save
      redirect_to("/payment_types/#{the_payment_type.id}", { :notice => "Payment type updated successfully."} )
    else
      redirect_to("/payment_types/#{the_payment_type.id}", { :alert => "Payment type failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_payment_type = PaymentType.where({ :id => the_id }).at(0)

    the_payment_type.destroy

    redirect_to("/payment_types", { :notice => "Payment type deleted successfully."} )
  end
end
