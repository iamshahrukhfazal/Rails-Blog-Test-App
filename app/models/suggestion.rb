# frozen_string_literal: true

class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum status: { pending: 'Pending', cancel: 'Cancel', approved: 'Approved' }

  scope :my_suggestions, ->(id) { where(user_id: id) }
  # Ex:- scope :active, -> {where(:active => true)}
end
