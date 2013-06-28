class StaticPagesController < ApplicationController
  def home
    @cars = Car.paginate(page: params[:page])
    @cars_vip = Car.where("vip = ?", true).shuffle.first(3)
  end

  def about
  end
end
