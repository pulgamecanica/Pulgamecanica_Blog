class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.boolean :published, default: false
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
