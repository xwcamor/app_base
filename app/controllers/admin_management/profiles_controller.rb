module Admin
  class ProfilesController < ApplicationController
    # Autentication
    before_action :authenticate_account!
    before_action -> { authorize!('index', 'Profile') }, only: [:index]
    before_action -> { authorize!('new',   'Profile') }, only: [:new, :create]
    before_action -> { authorize!('show',  'Profile') }, only: [:show]
    before_action -> { authorize!('edit',  'Profile') }, only: [:edit, :update]
    before_action -> { authorize!('delete','Profile') }, only: [:delete, :destroy]

    # call private actions
    before_action :set_default_values
    before_action :set_model, only: [:show, :edit, :update, :destroy, :delete]
    before_action :set_main_form, only: [:new, :create, :edit, :update]
    before_action :set_list_collections, only: [:new, :edit, :create, :update]
   
    # Action Index
    def index
      @list_array = @main_model.includes(image_attachment: :blob).not_deleted
      
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
      @main_table.update(deleted: true, deleted_DESCription: params[@param_model][:deleted_DESCription])
      
      respond_to do |format|
        format.js
      end
    end
    
    # Private actions
    private
    
    def set_default_values
      @main_model  = Profile
      @param_model = :profile
      @main_url    = "/admin/profiles"    
      @title_index = "Pefiles"
      @title_modal = "Perfil"
    end

    def set_main_form
      @main_form    = 'form'
    end

    def set_list_collections
      @accesses = Access.all 
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