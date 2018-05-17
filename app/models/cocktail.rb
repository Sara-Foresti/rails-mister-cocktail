class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  # You can't delete an ingredient if it used by at least one cocktail
  # just by adding dependent: :destroy to doses, it'll work, because
  # the dose is the unique combination that hold cocktails and ingredients
  # so we won't destroy ingredient!
  validates :name, presence: true, uniqueness: true
end
