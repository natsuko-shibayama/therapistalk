class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
