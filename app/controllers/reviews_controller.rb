class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    render({ :template => "reviews/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    render({ :template => "reviews/show.html.erb" })
  end

  def create
    the_review = Review.new
    the_review.provider_id = params.fetch("query_provider_id")
    the_review.author_id = @current_user.id
    the_review.description = params.fetch("query_description")
    # the_review.title = params.fetch("query_title")

    if the_review.valid?
      the_review.save
      redirect_to("/provider/#{the_review.provider_id}", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :notice => "Review failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.provider_id = params.fetch("query_provider_id")
    the_review.author_id = params.fetch("query_author_id")
    the_review.rating = params.fetch("query_rating")
    the_review.description = params.fetch("query_description")
    the_review.title = params.fetch("query_title")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => "Review failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/provider/#{the_review.provider_id}", { :notice => "Review deleted successfully."} )
  end
end
