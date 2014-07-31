#encoding: UTF-8
class FeedbacksController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy]

  def index
    @feedback = Feedback.new
    if signed_in?
      @feedbacks = Feedback.paginate(page: params[:page], per_page: 10)
    else
      @feedbacks = Feedback.where("checkf = ?", true).paginate(page: params[:page], per_page: 10)
    end
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      flash[:success] = "Спасибо. Отзыв будет отображен после проверки администратором сайта."
      redirect_to feedbacks_url
    else
      if signed_in?
        @feedbacks = Feedback.paginate(page: params[:page], per_page: 10)
      else
        @feedbacks = Feedback.where("checkf = ?", true).paginate(page: params[:page], per_page: 10)
      end
      render 'index'
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update_attributes(params[:feedback])
      flash[:success] = "Отзыв сохранен."
      redirect_to feedbacks_url
    else
      render 'edit'
    end
  end

  def destroy
    Feedback.find(params[:id]).destroy
    flash[:success] = "Отзыв удален."
    redirect_to feedbacks_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Пожалуйста, войдите."
      end
    end
end
