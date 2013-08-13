#encoding: UTF-8
class SettingsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :admin_user,     only: [:index, :edit, :update]

  def index
    @settings = Setting.thing_scoped.all    
  end
  
  def edit
    @setting = Setting.find(params[:id])
    @setting[:value] = YAML.load(@setting[:value]) 
  end 
  
  def update
    @setting = Setting.find(params[:id])
    @setting.value = params[:setting][:value]

    if @setting.save
      redirect_to settings_path, notice: "Настройки сохранены."
    else
      render "edit"
    end
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите."
      end
    end
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
