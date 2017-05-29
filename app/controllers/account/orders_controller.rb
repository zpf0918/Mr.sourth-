class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout 'usercenter'
  def index
    @orders = current_user.orders.order("id DESC")
  end
end
