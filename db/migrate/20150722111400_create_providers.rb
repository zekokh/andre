class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :comments
      t.string :contact_name

      t.timestamps
    end
  end
end
