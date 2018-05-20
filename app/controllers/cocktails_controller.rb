class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
    @ingredients = Ingredient.all.order(:name)

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.photo.model.id == nil
      url = "http://icons.iconarchive.com/icons/iconsmind/outline/512/Cocktail-icon.png"
      @cocktail.remote_photo_url = url
    end
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
