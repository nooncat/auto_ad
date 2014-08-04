#encoding: UTF-8
class CarsController < ApplicationController
  before_filter :signed_in_user, only: [:edit,:create, :update, :new, :destroy]

  def index
    @cars = Car.paginate(page: params[:page], per_page: 15)
    @feedbacks = Feedback.where("checkf = ?", true).shuffle.first(3)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
      flash[:success] = "Объявление успешно размещено."
      redirect_to cars_url
    else
      render 'new'
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(params[:car])
      flash[:success] = "Объявление изменено."
      redirect_to cars_url
    else
      render 'edit'
    end
  end

  def destroy
    Car.find(params[:id]).destroy
    flash[:success] = "Объявление удалено."
    redirect_to root_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите."
      end
    end
end
