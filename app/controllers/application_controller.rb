class ApplicationController < ActionController::Base
  before_action :store_current_location, :unless => :devise_controller?
  protect_from_forgery with: :exception

  def  admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end



  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

  def store_current_location
   if request.format == "text/html" || request.content_type == "text/html"
     store_location_for(:user, request.url)
     end
   end


  def after_sign_out_path_for(resource)
   request.referrer || root_path
  end

end
