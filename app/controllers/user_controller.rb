class UserController < ApplicationController
  def register
    @user = Users.new
  end
  
  def create
    if request.post? and params[:user]
      @user = Users.new(params[:user])
      valid_user = Users.find(:first,:conditions => ["username = ? and password = ?",@user.username, @user.password])
      if valid_user 
        flash[:notice]= 'You are already registered'
        redirect_to  :controller => 'user',:action => 'register' 
      else  
        if @user.save
          session[:userid] = @user.id
          redirect_to :controller => 'dashboard', :action => 'my_account'
        else 
          respond_to do |format|
            flash[:notice]= 'Password mismatch'
            format.html { render :action => "register" }
          end 
        end
      end
    end 
  end
  
  def login
    logger.info "login"
    if request.post? and params[:user]
      @user = Users.new(params[:user])
      valid_user = Users.find(:first,:conditions => ["username = ? and password = ?",@user.username, @user.password])
      if valid_user
        logger.info " id :" + valid_user.id.to_s
        flash[:notice]= 'You are successfully logged in'
        session[:userid] = valid_user.id
        redirect_to :controller => 'dashboard', :action => 'my_account'
      else
        flash[:notice]= 'Invalid Credentials'
      end
    end
  end
  
  def logout
    if session[:userid]
      reset_session
    end
    redirect_to :action => 'login'    
  end
  
end
