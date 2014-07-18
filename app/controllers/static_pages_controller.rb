class StaticPagesController < ApplicationController
  def home
    @cars = Car.paginate(page: params[:page], per_page: 15)
    @cars_teaser = Car.all.shuffle.first(3)
    @feedbacks = Feedback.where("checkf = ?", true).shuffle.first(3)
  end

  def about
  end
end
