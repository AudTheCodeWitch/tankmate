class Task < ApplicationRecord
  has_many :maintenances
  has_many :tanks, through: :maintenances
  accepts_nested_attributes_for :maintenances
  accepts_nested_attributes_for :tanks


  # def maintenances_attributes=(maintenances_attributes)
  #   maintenances_attributes[:tank_id].each do |t|
  #     self.maintenance.build = Maintenance.create(complete: maintenance_attributes[:complete], tank_id: t) unless t.blank?
  #   end
  # end
end
