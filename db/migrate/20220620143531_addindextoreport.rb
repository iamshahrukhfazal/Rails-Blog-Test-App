class Addindextoreport < ActiveRecord::Migration[5.2]
  def change
    add_index :reports,[:user_id, :reportable_id,:reportable_type]
    add_index :reports, [:reportable_id,:reportable_type]
  end
end
