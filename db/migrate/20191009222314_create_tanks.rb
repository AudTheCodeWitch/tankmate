class CreateTanks < ActiveRecord::Migration[6.0]
  def change
    create_table :tanks do |t|
      t.string :name
      t.integer :size
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
