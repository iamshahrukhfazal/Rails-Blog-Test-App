# frozen_string_literal: true

# Doc for the class
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  def self.last_likes
    Like.last(10).sort_by(&:updated_at).reverse
  end
end
