class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :body, null: false, length: 140
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
