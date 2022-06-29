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
    Post.last(10)
  end

  scope :find_by_field_substring, ->(query) do
    where("title ILIKE ?", "%#{query}%") 
  end
end
