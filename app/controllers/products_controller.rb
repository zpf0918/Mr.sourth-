class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :unfavorite]
  before_action :validate_search_key, only: [:search]
  impressionist :actions=>[:show]
  def search
    if @query_string.present?
      @products = search_params
    end
  end

  def index

    # 分类功能
    if params[:category].present?
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("position ASC").published.paginate(:page => params[:page], :per_page => 12)
     # 排序功能
    else
      @products = case params[:order]
        when 'by_product_price'
          Product.published.order('price DESC').paginate(:page => params[:page], :per_page => 12)
        when 'by_fans'
          Product.published.all.order("position ASC").paginate(:page => params[:page], :per_page => 12)
        else
          Product.published.recent.paginate(:page => params[:page], :per_page => 12)
        end
    end
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @suggests = Product.published.random5 #随机推荐5个职位

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

  def add_buying_quantity
  if @product.buying_quantity <= @product.quantity
    @product.buying_quantity +=1
    @product.save
   redirect_to :back
  end
end

def remove_buying_quantity
  if @product.buying_quantity > 1
    @product.buying_quantity -= 1
    @product.save
    redirect_to :back
  end
end




protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")if params[:q].present?
  end


  def search_params
    Product.ransack({:title_or_description_cont => @query_string}).result(distinct: true)
  end

end
