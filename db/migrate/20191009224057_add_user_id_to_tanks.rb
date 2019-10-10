class AddUserIdToTanks < ActiveRecord::Migration[6.0]
  def change
    add_column :tanks, :user_id, :integer
  end
end
