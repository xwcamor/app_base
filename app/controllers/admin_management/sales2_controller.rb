module Admin
  class SalesController < ApplicationController
    # Autentication
    before_action :authenticate_account!
    before_action -> { authorize!('index', 'Sale') }, only: [:index]
    before_action -> { authorize!('new',   'Sale') }, only: [:new, :create]
    before_action -> { authorize!('show',  'Sale') }, only: [:show]
    before_action -> { authorize!('edit',  'Sale') }, only: [:edit, :update]
    before_action -> { authorize!('delete','Sale') }, only: [:delete, :destroy]

    # call private actions
    before_action :set_default_values
    before_action :set_list_collections
    before_action :set_model, only: [:show, :edit, :update, :destroy, :delete, :cancel_sale]
    before_action :set_main_form, only: [:new, :create, :edit, :update]
   
    # Action Index
    def index
      @list_array = @main_model.includes(:employee,:customer,:type_payment,:report_payment,:account).not_deleted.order("created_at DESC")
      
      respond_to do |format|
        format.html
        format.js
        format.json
      end
    end
    
    # Action New
    def new
      @action_title = "Nuevo"
      @main_table = @main_model.new   
      #5.times do 
        @main_table.sale_details.build 
      #end    
    end
    
    # Action Create
    def create
      @action_title = "Nuevo"
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
      @action_title = "Mostrar"
      @main_form    = 'form_show'
    end
    
    # Action Edit
    def edit
      @action_title = "Editar"
    end
    
    # Action Update
    def update
      @action_title = "Editar"

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
      @action_title = "Eliminar"
      @main_form    = 'form_delete'
    end

    # Action Destroy
    def destroy
      @main_table.update(deleted: true, deleted_DESCription: params[@param_model][:deleted_DESCription])
      
      respond_to do |format|
        format.js
      end
    end
    
    # Accion Cancel Sale
    def cancel_sale
      @action_title = "Cancelar Venta"
      @main_form    = 'form_cancel'
    end

    # Private actions
    private
    
    def set_default_values
      @main_model  = Sale
      @param_model = :sale
      @main_url    = "/admin/sales"    
      @title_index = "Ventas"
      @title_modal = "Venta"
    end

    def set_main_form
      @main_form    = 'form'
    end

    def set_model
      @main_table = @main_model.find(params[:id])
    end
    
    # Selects para el formulario
    def set_list_collections
      @list_customers = Customer.where(deleted: false, active: true)
      @list_employees = Employee.where(deleted: false, active: true)
      @list_report_payments = ReportPayment.where(deleted: false, active: true)
      @list_type_payments = TypePayment.where(deleted: false, active: true)
      @list_products = Product.where(deleted: false, active: true)
    end
    
    # Params for model
    def model_attributes
      params.require(@param_model).permit!
    end
  end
end