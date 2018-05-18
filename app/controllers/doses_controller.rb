class DosesController < ApplicationController
  def new
    @dose = Dose.new
    # we need to find the cocktail by id
    @cocktail = Cocktail.find(params[:cocktail_id])
    # we need the list of ingredients
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail_id = @dose.cocktail_id
    @dose.destroy
    @cocktail = Cocktail.find(cocktail_id)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

# when we submit attributes through a form the attributes we want for our model
# need to be white listed through
# the strong params method (params.require(:model).permit(:attr1, :attr2 ...))
# we are not sending cocktail_id with the form, we get it from the params
