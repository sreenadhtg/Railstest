# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'af42d6a3494c36f78f1f5c7f0e663aa1'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  layout "application"
  #before_filter :login_required

    def login_required
      if session[:userid] == nil
        logger.info "Access denied"
        redirect_to :controller => 'user', :action => 'login'
      else
         logger.info "User Present" 
         @user = Users.find(session[:userid])
      end
    end
  
end
