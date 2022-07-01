# frozen_string_literal: true

# Documentation for the Class
class Report < ApplicationRecord
  # foreign Keys
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :report_status, presence: true

  scope :reported_comment, -> { where(reportable_type: 'Comment') }
  scope :reported_post, -> { where(reportable_type: 'Post') }
  scope :reported_status, -> { Report.where.not(report_status: nil) }
  scope :all_reported_post, ->(id) { where(reportable_id:id)}



  enum report_status: { Abusive: 'Abusive', Under18: 'Under18' }

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
