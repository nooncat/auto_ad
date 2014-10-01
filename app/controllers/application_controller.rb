class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :check_callbacks

  def handle_unverified_request
    sign_out
    super
  end

  def check_callbacks
    if signed_in?
      @callbacks_new = Client.where("information IS NULL or information = ''")
    end
  end
end

