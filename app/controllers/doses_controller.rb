class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def destroy

    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail # l utiliser pour le path
    @dose.destroy

    # no need for app/views/doses/destroy.html.erb
    redirect_to cocktail_path(@dose.cocktail)
  end

    def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
    # no need for app/views/doses/create.html.erb
    redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
