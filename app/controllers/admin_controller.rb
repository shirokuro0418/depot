class AdminController < ApplicationController
  def index
    @tatal_orders = Order.count
  end
end
