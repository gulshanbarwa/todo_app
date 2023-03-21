class CurrentController < ApplicationController

	before_action :set_current_user


	def set_current_user
		if session[:user_id]
			l4 = session[:datum_id]
      		@datum = Datum.where(id: l4)
			Current.user = User.find_by(id: session[:user_id])
			@current = Current.user
		else
			redirect_to root_path
		end
	end

	def show_user_data
		if session[:user_id]
			@user_data = Datum.all
		else
			redirect_to root_path
		end
  	end




end
