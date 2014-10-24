class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      
      t.date :dateofincident, null: false
      t.integer :valueofclaim, null: false
      t.string :typeofincident, null: false
	  t.string :description, null: false
	  t.references :user, null: :no
      t.timestamps
    end
 
	
  end
end
