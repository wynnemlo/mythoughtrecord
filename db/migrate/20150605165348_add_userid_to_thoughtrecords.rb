class AddUseridToThoughtrecords < ActiveRecord::Migration
  def change
    add_column :thoughtrecords, :user_id, :integer
  end
end
