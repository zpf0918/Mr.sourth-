class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :unfavorite]
  before_action :validate_search_key, only: [:search]

  def search
    if @query_string.present?
      @products = search_params
    end
  end

  def index
    if params[:category].blank?
      @products = Product.published.order("position ASC").recent.paginate(:page => params[:page], :per_page => 12)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id).published.recent.paginate(:page => params[:page], :per_page => 12)
    end
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all

    if @product.is_hidden
      flash[:warning] = "此商品已下架"
      redirect_to products_path
    end
  end


  def add_to_cart
    @product = Product.find(params[:id])
  if !current_cart.products.include?(@product)
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "你已成功将 #{@product.title  } 加入购物车 "
  else
    flash[:warning] = "你的购物车已有此物品"
  end
    redirect_to :back
  end

  def favorite
		@product = Product.find(params[:id])
		current_user.favorite_products << @product
    flash[:notice] = "您已收藏宝贝"
		redirect_to :back
	end

	def unfavorite
		@product = Product.find(params[:id])
		current_user.favorite_products.delete(@product)
    flash[:warning] = "您已取消收藏宝贝"
		redirect_to :back
	end




protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")if params[:q].present?
  end

private

  def search_params
    Product.ransack({:title_or_description_cont => @query_string}).result(distinct: true)
  end

end
