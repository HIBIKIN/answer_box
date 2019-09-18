class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
