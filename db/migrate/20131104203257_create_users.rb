class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :title , null: false
	  t.string :firstname, null: false
      t.string :surname, null: false
      t.integer :phone
      t.date :dateofbirth, null: false
      t.boolean :licencetype, default: true
      t.string :licenceperiod, null: false
	  t.references :occupation, null: :no
      t.timestamps
    end
	add_index :users, :surname
	
  end
end
