class CreateMaintenance < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.boolean :complete
      t.date :due
      t.text :notes
      t.integer :tank_id
      t.integer :task_id
    end
  end
end
