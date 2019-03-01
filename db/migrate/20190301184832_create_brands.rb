class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :logo
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
