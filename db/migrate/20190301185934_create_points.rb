class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :name
      t.text :image
      t.integer :points

      t.timestamps
    end
  end
end
