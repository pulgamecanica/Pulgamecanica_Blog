class AddAuthorsToProject < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :author, null: false, foreign_key: true
    add_column :projects, :published, :boolean
    add_column :projects, :published_at, :datetime
    add_column :projects, :slug, :string
    add_index :projects, :slug, unique: true
  end
end
