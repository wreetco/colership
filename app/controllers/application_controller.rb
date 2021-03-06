class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def fofo
		respond_to do |format|
      format.html { render template: 'home/404', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
	end 	

end
