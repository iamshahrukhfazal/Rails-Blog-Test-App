class Suggestion < ApplicationRecord
  
  belongs_to :user
  belongs_to :post 

  enum status: { pending: "Pending", cancel: "Cancel", approved: "Approved" }

end
