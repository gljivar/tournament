class ApplicationController < ActionController::Base
  before_filter :require_login
#  protect_from_forgery
  helper_method :current_user

  private

  # AngularJS automatically sends CSRF token as a header called X-XSRF
  # this makes sure rails gets it
  def verified_request?
    !protect_against_forgery? || request.get? ||
      form_authenticity_token == params[request_forgery_protection_token] ||
      form_authenticity_token == request.headers['X-XSRF-Token']
  end

  # Authorization

  def require_login
    if current_user == nil
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => [], :status => :unauthorized }
      end
      return false
    end
  end 

  def current_user
    if session[:user_id] != nil
      return session[:user_id]
    end
    return nil
  end

 end
