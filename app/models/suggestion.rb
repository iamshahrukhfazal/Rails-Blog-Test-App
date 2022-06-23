class Suggestion < ApplicationRecord
  
  belongs_to :user
  belongs_to :post 

  enum status: { pending: "Pending", cancel: "Cancel", approved: "Approved" }
  

  scope :mySuggestions, ->(id) { where(:user_id => id)}
  # Ex:- scope :active, -> {where(:active => true)}
end
