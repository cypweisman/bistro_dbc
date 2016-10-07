require 'securerandom'

module RecipeHelper

  def generate_ingredient_symbol
    ("ingredient_" + SecureRandom.hex(3)).to_sym
  end

end
