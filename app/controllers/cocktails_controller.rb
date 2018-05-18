class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail  = Cocktail.find(params[:id])
  end

  def new
    @cocktail  = Cocktail.new
  end

  def create
    @cocktail  = Cocktail.new(cocktail_params)
    if @cocktail.save
      # no need for app/views/cocktails/create.html.erb
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    # Pas besoin de vue quand on fait un redirect_to
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(
      :name,
      :photo
    )
  end

end
