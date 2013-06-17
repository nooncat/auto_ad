class StaticPagesController < ApplicationController
  def home
    @cars = Car.paginate(page: params[:page])
  end

  def about
  end
end
