class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :login
      t.string :password
      t.string :birthday
      t.string :phone
      t.string :role

      t.timestamps
    end
  end
end
