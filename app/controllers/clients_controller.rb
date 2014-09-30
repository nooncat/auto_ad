#encoding: UTF-8
class ClientsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]

  def create
    @client = Client.new(params[:client])
    if @client.save
      if request.env["PATH_INFO"] == clients_path
        flash[:success] = "Клиент сохранен."
      else
        flash[:success] = "Спасибо! Менеджер перезвонит Вам в ближайшее время."
      end
    end
    redirect_to :back
  end

  def index
    @callbacks = Client.where("information IS NULL or information = ''").order('created_at DESC').paginate(page: params[:callbacks_page], per_page: 12)
    @clients = Client.where("information IS NOT NULL and information != ''").order('created_at DESC').paginate(page: params[:clients_page], per_page: 12)
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:success] = "Изменения сохранены."
      redirect_to clients_url
    else
      render 'edit'
    end
  end

  def destroy
    Client.find(params[:id]).destroy
    flash[:success] = "Заявка удалена."
    redirect_to :back
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите."
      end
    end
end
