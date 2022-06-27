# frozen_string_literal: true

class Change < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :status, :string
  end
end
