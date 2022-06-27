# frozen_string_literal: true

class AddStatusFeildToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :status, :integer
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
