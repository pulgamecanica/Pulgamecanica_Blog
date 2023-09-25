class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :published, default: false
      t.datetime :published_at
      t.references :author, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
