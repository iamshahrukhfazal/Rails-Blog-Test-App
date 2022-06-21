class Report < ApplicationRecord
  enum report_status: { Abusive: "Abusive", Under18: "Under18" }

  belongs_to :user
  belongs_to :reportable, polymorphic: true 
end
