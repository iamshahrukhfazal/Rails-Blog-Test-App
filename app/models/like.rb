# frozen_string_literal: true

# Doc for the class
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  # validates :user_id, uniqueness: { scope: %i[likeable_id likeable_type] }

  def self.last_likes
    Like.last(10).sort_by(&:updated_at).reverse
  end

  # Ex:- scope :active, -> {where(:active => true)}
end
