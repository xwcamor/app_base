class Accounts::SessionsController < Devise::SessionsController
  def index
  	
  end
    # Private actions
    private

    # Important! - Change values according the model
    def set_main_model
      @main_model  =  Account
      @param_model = :account
    end

    # Don't change the Order! settings for set_model (second action)
    def set_model
      @main_table = @main_model.find(params[:id])
    end	
end