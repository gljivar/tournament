class SessionsController < ApplicationController
respond_to :json
skip_before_filter :require_login 
  
  def get_user
    self.response.headers['Last-Modified'] = Time.now.ctime.to_s

    if current_user
      user = User.find(session[:user_id])
      user_j = { :user_id => user.id, :username => user.username, :logged_in => true }
    else
      user_j = { :user_id => 'undefined', :username => 'undefined', :logged_in => false }
    end

    respond_to do |format|
      format.html
      format.json { render :json => user_j.to_json }
    end

  
   # u = { :user_id => 1, :username => 'm', :logged_in => true }
   # respond_to do |format|
   #   format.html
   #   format.json { render :json => u.to_json }
   # end
  end

  def login
    username = params[:username]
    password = params[:password]

    if User.count == 0
      user = User.new
      user.username = 'admin'
      user.password = 'admin'
      user.save

      username = user.username
      password = user.password 
    end 

    user = User.find_by_username_and_password(username, password)

    if user.username == username  
      user_j = { :user_id => user.id, :username => user.username, :logged_in => true }
      session[:user_id] = user.id 

      respond_to do |format|
        format.html
        format.json { render :json => user_j.to_json }
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
