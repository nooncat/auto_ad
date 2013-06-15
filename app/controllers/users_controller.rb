#encoding: UTF-8
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:index, :destroy, :create, :new]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Пользователь успешно создан!"
      redirect_to root_url 
    else
      render 'new'
    end
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён."
    redirect_to users_url
  end

  def edit
  end
  
  def update
    user = User.find_by_name(current_user.name).try(:authenticate, params[:current_password])
    if user && @user.update_attributes(params[:user])
      flash[:success] = "Пароль изменен!"
      sign_in @user
      redirect_to root_url
    else
      flash.now[:error] = "error Неверный текущий пароль" unless user
      render 'edit'
    end
  end
  
  private
  
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
