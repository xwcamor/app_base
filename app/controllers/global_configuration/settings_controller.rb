module GlobalConfiguration
  class SettingsController < ApplicationController
    # Autentication
    before_action :authenticate_account!
    before_action -> { authorize!('index', 'AppSetting') }, only: [:index]
    before_action -> { authorize!('new',   'AppSetting') }, only: [:new, :create]
    before_action -> { authorize!('show',  'AppSetting') }, only: [:show]
    before_action -> { authorize!('edit',  'AppSetting') }, only: [:edit, :update]
    before_action -> { authorize!('delete','AppSetting') }, only: [:delete, :destroy]

    # call private actions
    before_action :set_default_values
    before_action :set_model, only: [:show, :edit, :update, :destroy, :delete]
    before_action :set_main_form, only: [:new, :create, :edit, :update]
   
    # Action Index
    def index
      @list_array = @main_model.all#.includes(image_attachment: :blob).where(deleted: false)
      
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
      #@main_table.update(deleted: true, deleted_description: params[@param_model][:deleted_description])
      
      respond_to do |format|
        format.js
      end
    end
    
    # Private actions
    private
    
    def set_default_values
      @main_model  = AppSetting
      @param_model = :app_setting
      @main_url    = "/global_configuration/settings"    
      @title_index = "Configuraciones del Sistema"
      @title_modal = "Configuración del Sistema"
    end

    def set_main_form
      @main_form    = 'form'
    end

    def set_model
      @main_table = @main_model.find(params[:id])
    end
    
    # Params for model
    def model_attributes
      params.require(@param_model).permit!
    end
  end
end