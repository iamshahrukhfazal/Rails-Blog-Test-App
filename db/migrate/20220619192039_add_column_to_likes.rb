# frozen_string_literal: true

class AddColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :likeable_type, :string
  end
end
