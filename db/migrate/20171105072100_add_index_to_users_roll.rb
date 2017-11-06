class AddIndexToUsersRoll < ActiveRecord::Migration[5.1]
  def change
    add_index :users,:roll,unique:true
  end
end
