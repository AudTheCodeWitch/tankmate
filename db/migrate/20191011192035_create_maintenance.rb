class CreateMaintenance < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.date :due
      t.boolean :complete?
      t.text :notes
      t.integer :tank_id
      t.integer :task_id
    end
  end
end
