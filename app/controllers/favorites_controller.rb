class FavoritesController < ApplicationController
  layout 'usercenter'
  def index
    @products = current_user.favorite_products
  end
end
