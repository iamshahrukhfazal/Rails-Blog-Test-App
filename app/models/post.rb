# frozen_string_literal: true

# Doc for the class
class Post < ApplicationRecord
  enum status: { published: 'published', draft: 'draft', unpublished: 'unpublished' }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  validates :content, presence: true
  validates :title, presence: true

  has_rich_text :content

  def self.last_posts
    Post.where(status: "published").last(10).sort_by(&:updated_at).reverse
  end

  scope :search_by_field_substring, lambda { |query|
    where('title ILIKE ?', "%#{query}%")
  }
end
