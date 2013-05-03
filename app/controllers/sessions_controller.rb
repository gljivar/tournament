class SessionsController < ApplicationController
respond_to :json
skip_before_filter :require_login 

  def get_user
    u = { :user_id => 1, :username => 'm', :logged_in => true }
    respond_to do |format|
      format.html
      format.json { render u.to_json }
    end
  end

  def login
    username = params[:username]
    password = params[:password]

    if username == 'miro' and password == 'miro'
      user = { :user_id => 1, :username => username, :logged_in => true }
      session[:user_id] = 1 

      respond_to do |format|
        format.html
        format.json { render :json => user.to_json } # user.to_json }
      end
    elsif session[:user_id] != nil
      user = { :user_id => 1, :username => username, :logged_in => true }

      respond_to do |format|
        format.html
        format.json { render :json => user.to_json } # user.to_json }
      end
    else
      respond_to do |format|
        format.html
        format.json { render :json => [], :status => :unauthorized }
      end
    end    
 
  end

  def logout
    session[:user_id] = nil
  end
end
