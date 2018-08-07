class CreateCrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :crafts do |t|
      t.string :title
      t.string :host_name
      t.string :craft_type
      t.string :level
      t.float :price
      t.date :date
      t.string :start_time
      t.string :end_time
      t.string :city
      t.string :venue
      t.string :description
      t.string :inclusive
      t.string :phone
      t.integer :max_participant

      t.belongs_to :user

      t.timestamps
    end
  end
end
