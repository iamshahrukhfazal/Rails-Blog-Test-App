# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true

  has_many :comments, foreign_key: 'parent_id', dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_rich_text :content

  def self.lastComments
    Comment.last(10)
  end
end
