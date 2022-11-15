class CreateCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :create_users do |t|
      t.string :email, unique: true
      t.string :name
      t.string :api_key

      t.timestamps
    end
  end
end
