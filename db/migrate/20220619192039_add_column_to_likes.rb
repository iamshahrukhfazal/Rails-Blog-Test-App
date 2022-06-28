# frozen_string_literal: true

# Service to download ftp files from the server
class AddColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :likeable_type, :string
  end
end
