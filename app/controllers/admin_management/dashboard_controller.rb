module AdminManagement
  class DashboardController < ApplicationController
    # Autentication
    before_action :authenticate_account!
    
    # Action Index
    def index
      @main_url = "/admin_management/dashboard"
      @title_index = "Dashboard"      
      @sales_today = Sale.created_today
      @sales_this_month = Sale.created_this_month
      @sales_this_year = Sale.created_this_year
      @canceled_sales = Sale.canceled
      @total_revenue = @sales_this_year.map(&:total_payment).sum
      @most_sold_products = SaleDetail.joins(:product).group('products.name').order('sum_quantity DESC').limit(5).sum(:quantity)
      @least_sold_products = SaleDetail.joins(:product).group('products.name').order('sum_quantity ASC').limit(5).sum(:quantity)
      @payments_by_type = Sale.group(:type_payment_id).count
    end

    # Private actions
    private

    # Important! - Change values according the model
    def set_main_model
    end 

  end
end