class AddQuantityToFish < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :quantity, :integer
  end
end
