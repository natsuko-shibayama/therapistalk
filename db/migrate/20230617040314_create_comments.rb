class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment,         null: false
      t.references :talk,      null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
