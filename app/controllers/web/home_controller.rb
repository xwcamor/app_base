class Web::HomeController < ApplicationController
  def index
  end
    

    private

    def set_main_model
      #@main_model = Dashboard
      #@param_model = :dashboard
    end

    def set_main_form
      @main_form = 'form'
    end

    def set_model
      @main_table = @main_model.find(params[:id])
    end

end
