class AddQuantityToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :quantity, :integer
  end
end
