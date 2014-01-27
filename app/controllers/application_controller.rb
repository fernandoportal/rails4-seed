class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_locale, :check_user_data
  
  private
    
    # returns the signed in user
    def current_user
      @current_user || User.find(session[:user_id]) if session[:user_id]
    end
    
    # this method is called from non public controllers
    def signed_in?
      redirect_to root_url if current_user.nil?
    end
    
    helper_method :current_user
    helper_method :signed_in?
    
    def set_locale
      I18n.locale = session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end
    
    # amoniauth with twitter force this check to prevent user data nil
    def check_user_data
      if !current_user.nil?
        redirect_to profile_path if current_user.email.nil? || current_user.first_name.nil? || current_user.last_name.nil? || current_user.gender.nil?
      end
    end
    
    helper_method  :check_user_data
  
end
