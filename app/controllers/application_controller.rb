require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  private

  def require_login
    unless current_user
      redirect_to new_user_session_path, :alert => "Sign Up or Login to see the events!"
    end
  end

  #   def current_user
  #     # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #     return current_user
  #   end

  #   helper_method :current_user
end
