#encoding: UTF-8
class ClientsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:success] = "Спасибо! Менеджер перезвонит Вам в ближайшее время."
    end
    redirect_to root_url
  end

  def index
    @callbacks = Client.paginate(page: params[:page], per_page: 10)
    @clients = Client.paginate(page: params[:page], per_page: 10)
    @client = Client.new
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите."
      end
    end
end
