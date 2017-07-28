class Admin::ProductsController < ApplicationController

  layout "admin"

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_required


  def index
    @products = Product.all.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @photo = @product.photos.build
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params[:photos] != nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(:avatar => a)
        end
      end
      redirect_to admin_products_path
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    status = params[:status].nil? ? "update" : params[:status]
    success =
    case status
    when "update"
      @product.update(product_params)
    when "move_up"
      @product.move_higher
    when "move_down"
      @product.move_lower
    when "publish"
      @product.publish!
    when "hide"
      @product.hide!
    else
      false
    end

    if params[:photos] != nil
      @product.photos.destroy_all #need to destroy old pics first

      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end
    end

    if success
      redirect_to admin_products_path
    else
      @categories = Category.all
      render :edit
    end
    
  end



  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to admin_products_path
  end


  def discount_price
    @product = Product.find(params[:id])
    if @product.discount.present?()
       @product.price = @product.price * (@product.discount / 100 )
    end
  end


 private

 def product_params
   params.require(:product).permit(:title, :description, :price, :quantity, :image, :category_id, :is_hidden, :discount)
 end

end
