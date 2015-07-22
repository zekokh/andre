class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :contact_name
      t.string :phone
      t.string :address
      t.string :comments

      t.timestamps
    end
  end
end
