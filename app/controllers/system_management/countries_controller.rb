module SystemManagement  # Main Folder
  class CountriesController < ApplicationController  # Controller Name
    # Autentication
    before_action :authenticate_account!
    
    # Call permissions
    before_action -> { authorize!('index', @main_model) }, only: [:index]
    before_action -> { authorize!('new',   @main_model) }, only: [:new, :create]
    before_action -> { authorize!('show',  @main_model) }, only: [:show]
    before_action -> { authorize!('edit',  @main_model) }, only: [:edit, :update]
    before_action -> { authorize!('delete',@main_model) }, only: [:delete, :destroy]
    
    # Call Private Actions
    before_action :set_model, only: [:show, :edit, :update, :destroy, :delete]
    before_action :set_main_form, only: [:new, :create, :edit, :update]
    before_action :set_list_collections, only: [:new, :create, :edit, :update, :index]

    # Action Search
    # Important! - Change values according the model
    def search      
      permitted_params = params.require(:q).permit(:name_cont, :active_eq)
      redirect_to action: :index, q: permitted_params, format: params[:format]
    end
   
    # Action Index
    def index
      @query = @main_model.ransack(params[:q])

      if request.format.xlsx?
        @list_array = @query.result.not_deleted.order("name DESC")
      else
        @list_array = @query.result.not_deleted.order("name DESC").page(params[:page])
      end
 
      respond_to do |format|
        format.html
        format.json
        format.xlsx { render xlsx: "index", filename: "#{@plural_title}_#{Date.today}.xlsx" }
      end
    end
    
    # Action New
    def new
      @main_table = @main_model.new
    end
    
    # Action Create
    def create
      @main_table = @main_model.new(model_attributes)
      respond_to do |format|
        if @main_table.save
          format.js
        else
          format.js { render :new }
        end
      end
    end
    
    # Action Show
    def show
      @main_form = 'form_show'
    end
    
    # Action Edit
    def edit
    end
    
    # Action Update
    def update
      respond_to do |format|
        if @main_table.update(model_attributes)
          format.js
        else
          format.js { render :edit }
        end
      end
    end

    # Action Delete
    def delete
      @main_form = 'form_delete'
    end

    # Action Destroy
    def destroy
      @main_table.update(deleted: true, deleted_description: params[@param_model][:deleted_description])
      respond_to do |format|
        format.js
      end
    end
    
    # Private actions
    private
    
    # Important! - Change values according the model
    def set_main_model
      @main_model  =  Country
      @param_model = :country
    end

    # Don't change the Order! settings for set_model (second action)
    def set_model
      @main_table = @main_model.find(params[:id])
    end
    
    # Don't change the Order! settings for set_form  (third action)
    def set_main_form
      @main_form = 'form'
    end

    # Setting Select Boxes
    def set_list_collections
      @list_languages = Language.where("deleted=0 AND active=1").order("name ASC")
    end
    
    # Params for model , this action is always the last don't change the orgder
    def model_attributes
      params.require(@param_model).permit!
    end
  end
end