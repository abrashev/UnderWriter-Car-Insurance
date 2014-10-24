class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.string :identification, null: false
      t.integer :quotepremium, default: 0
	  t.integer :policyexcess, default: 16
	  t.string :breakdowncover, null: false
	  t.boolean :windscreenrepair, default: false
	  t.integer :excesspaid, default: 5
      t.references :user, null: :no
      t.timestamps
    end
  end
end
