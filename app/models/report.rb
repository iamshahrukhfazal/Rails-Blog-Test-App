class Report < ApplicationRecord
  enum report_status: { Abusive: "Abusive", Under18: "Under18" }

  # foreign Keyes
  belongs_to :user
  belongs_to :reportable, polymorphic: true 

  # validation
  validates :user_id, uniqueness:{scope: [:reportable_id,:reportable_type]}
  validates :report_status, presence: true

# scope


  scope :reported_comment, -> {Report.where(reportable_type: "Comment")}
  scope :reported_post, -> {Report.where(reportable_type: "Post")}
  scope :reported_status, -> {Report.where.not(report_status: nil)}
  
  # c.reports.group(:report_status).size
  # 

  # scope :reported_post, -> {Report.where(`report_status IS NOT NULL `)}


  # def self.reported_comment
  #   Report.where("report_status IS NOT NULL")
  # end

end
