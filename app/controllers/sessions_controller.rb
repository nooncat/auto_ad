#encoding: UTF-8
class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to root_url  
    end
  end
  
  def create
    user = User.find_by_login(params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_url
    else
      flash.now[:error] = 'Неправильная комбинация логин/пароль'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
