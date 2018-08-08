class AddAvailabilityToCrafts < ActiveRecord::Migration[5.2]
  def change
  	add_column :crafts, :availability, :boolean, default: true
  end
end
