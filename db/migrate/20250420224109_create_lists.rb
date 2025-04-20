class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
