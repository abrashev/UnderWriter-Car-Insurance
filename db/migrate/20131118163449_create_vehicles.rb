class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :registration, null: false
      t.integer :mileage, default: 0
      t.integer :value, default: 0
      t.string :parkinglocation, null: false
      t.date :policystart, null: false
	  t.references :quotation, null: :no
      t.timestamps
    end
  end
end
