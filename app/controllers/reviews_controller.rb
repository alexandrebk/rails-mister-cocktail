class ReviewsController < ApplicationController

  def new
    @cocktail        = Cocktail.find(params[:cocktail_id])
    @review          = Review.new
    @review.cocktail = @cocktail
  end

  def create
    @cocktail        = Cocktail.find(params[:cocktail_id])
    @review          = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
    # no need for app/views/doses/create.html.erb
    redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :content,
      :cocktail_id
    )
  end

end
