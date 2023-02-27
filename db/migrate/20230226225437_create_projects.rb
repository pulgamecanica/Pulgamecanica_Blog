class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :rank
      t.integer :order

      t.timestamps
    end
  end
end
