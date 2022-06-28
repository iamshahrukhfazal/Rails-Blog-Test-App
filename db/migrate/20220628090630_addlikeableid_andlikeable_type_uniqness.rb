# frozen_string_literal: true

class AddlikeableidAndlikeableTypeUniqness < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, %i[likeable_id likeable_type], unique: true
  end
end
