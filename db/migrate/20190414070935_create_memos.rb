class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :title
      t.string :body
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
