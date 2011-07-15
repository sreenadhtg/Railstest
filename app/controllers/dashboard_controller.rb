class DashboardController < ApplicationController
   
  #before_filter :login_required
   def my_account
      logger.info "session -> user id " + session[:userid].to_s
      @user = Users.find(session[:userid])
     logger.info "myaccount"
   end
end