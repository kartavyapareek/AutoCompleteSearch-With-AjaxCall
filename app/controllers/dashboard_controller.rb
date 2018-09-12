class DashboardController < ApplicationController
  def index
  end

  def search
  	@users = User.ransack(first_name_or_last_name_cont: params[:q]).result()
  	respond_to do |format|
  		format.html {}
  		format.json {
  			@users
  		}
  	end
  end
end
