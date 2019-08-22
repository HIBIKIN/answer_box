class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title, null: false, length: 50
      t.text :description
      t.boolean :state, null: false, default: true
      t.integer :responce_num, default: 0

      t.timestamps
    end
  end
end
