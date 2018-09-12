class TransactionHistory < ApplicationRecord
	belongs_to :user
	belongs_to :user_card
end
