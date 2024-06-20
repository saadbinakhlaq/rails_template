class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :account, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
