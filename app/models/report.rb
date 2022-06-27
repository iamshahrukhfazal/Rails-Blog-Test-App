# frozen_string_literal: true

class Report < ApplicationRecord
  enum report_status: { Abusive: 'Abusive', Under18: 'Under18' }

  # foreign Keyes
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  # validation
  validates :user_id, uniqueness: { scope: %i[reportable_id reportable_type] }
  validates :report_status, presence: true

  # scope

  scope :reported_comment, -> { Report.where(reportable_type: 'Comment') }
  scope :reported_post, -> { Report.where(reportable_type: 'Post') }
  scope :reported_status, -> { Report.where.not(report_status: nil) }

  # c.reports.group(:report_status).size
  #

  # scope :reported_post, -> {Report.where(`report_status IS NOT NULL `)}

  def self.remove_comment_dup
    data = Report.reported_comment.reported_status
    data.uniq do |a_track|
      [
        a_track[:reportable_id]
      ]
    end
  end

  def self.remove_post_dup
    data = Report.reported_post.reported_status
    data.uniq do |a_track|
      [
        a_track[:reportable_id]
      ]
    end
  end
end
