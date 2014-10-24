class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, limit: 40, null: false
      t.string :city, limit: 40, null: false
      t.string :county, limit: 40, null: false
	  t.string :postcode, limit: 20, null: false
      t.references :user, null: :no, index: true
    end
  end

end
