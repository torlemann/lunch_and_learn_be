class DropCreateUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :create_users
  end
end
