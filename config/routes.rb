Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # A user can see the list of cocktails - index
  # GET "cocktails"

  # A user can see the details of a given cocktail
  # with the dose needed for each ingredient - show
  # GET "cocktails/42"

  # A user can create a new cocktail
  # GET "cocktails/new" - new
  # POST "cocktails" - create
  resources :cocktails, only: [:index, :show, :new, :create] do

  # A user can add a new dose (ingredient/description pair) to an existing cocktail
  # GET "cocktails/42/doses/new" - new
  # POST "cocktails/42/doses" - create

  # A user can delete a dose that belongs to an existing cocktail
  # DELETE "doses/25" - destroy
   resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]

  root to: "cocktails#index"
end
