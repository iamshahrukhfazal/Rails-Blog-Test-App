# frozen_string_literal: true

# Doc for class
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true

  has_many :comments, foreign_key: 'parent_id', dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  validates :content, presence: true
  has_rich_text :content

  def self.last_comments
    Comment.last(10).sort_by(&:updated_at).reverse
  end
end
