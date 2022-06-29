# frozen_string_literal: true

# Documentation for the Class
class Report < ApplicationRecord
  enum report_status: { Abusive: 'Abusive', Under18: 'Under18' }

  # foreign Keyes
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :report_status, presence: true

  scope :reported_comment, -> { Report.where(reportable_type: 'Comment') }
  scope :reported_post, -> { Report.where(reportable_type: 'Post') }
  scope :reported_status, -> { Report.where.not(report_status: nil) }

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
