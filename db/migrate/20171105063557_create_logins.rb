class CreateLogins < ActiveRecord::Migration[5.1]
  def change
    create_table :logins do |t|
      t.integer :user_id
      t.string :email

      t.timestamps
    end
  end
end
