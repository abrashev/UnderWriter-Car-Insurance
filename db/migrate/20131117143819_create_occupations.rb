class CreateOccupations < ActiveRecord::Migration
  def change
  create_table :occupations do |t|
      t.string :name , null: false
     end
  end
end
