class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :email, limit: 40, null: false
      t.string :salt, limit: 40, null: false
      t.string :crypted_password, limit: 40, null: false
      t.references :user, index: true
    end
  end

end
