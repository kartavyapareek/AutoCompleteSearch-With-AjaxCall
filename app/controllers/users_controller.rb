class UsersController < ApplicationController
	def show
		date = Date.today
		@user = User.find(params[:id])
		@onetimeall = @user.transaction_histories.where(transaction_type: "onetime").sum(:transaction_amount)
		@onetimemonth = @user.transaction_histories.where(transaction_type: "onetime", :created_at => (date.beginning_of_month..date.end_of_month))
		.sum(:transaction_amount)
		@onetimeyear = @user.transaction_histories.where(transaction_type: "onetime", :created_at => (date.beginning_of_year..date.end_of_year))
		.sum(:transaction_amount)

		@recurringall = @user.transaction_histories.where(transaction_type: "recurring").sum(:transaction_amount)
		@recurringmonth = @user.transaction_histories.where(transaction_type: "recurring", :created_at => (date.beginning_of_month..date.end_of_month))
		.sum(:transaction_amount)
		@recurringyear = @user.transaction_histories.where(transaction_type: "recurring", :created_at => (date.beginning_of_year..date.end_of_year))
		.sum(:transaction_amount)
	end
end
