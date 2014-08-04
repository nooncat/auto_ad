#encoding: UTF-8
class ClientsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:success] = "Спасибо! Менеджер перезвонит Вам в ближайшее время."
      redirect_to root_url
    else
      @cars = Car.paginate(page: params[:page], per_page: 15)
      @cars_teaser = Car.all.shuffle.first(3)
      @feedbacks = Feedback.where("checkf = ?", true).shuffle.first(3)
      render 'static_pages/home'
    end
  end

  def index
    @clients = Client.paginate(page: params[:page], per_page: 10)
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите."
      end
    end
end
