class Report < ApplicationRecord
  enum report_status: { Abusive: "Abusive", Under18: "Under18" }

  # foreign Keyes
  belongs_to :user
  belongs_to :reportable, polymorphic: true 

  # validation
  validates :user_id, uniqueness:{scope: [:reportable_id,:reportable_type]}
  validates :report_status, presence: true
end
