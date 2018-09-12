class User < ApplicationRecord
	has_one :media, dependent: :destroy, autosave: true
	has_many :transaction_histories, dependent: :destroy
	
	def name
	  [first_name,last_name].compact.join(" ")
	end

end
