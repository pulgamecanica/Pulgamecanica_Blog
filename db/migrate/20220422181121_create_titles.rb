class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.references :element, null: false, foreign_key: true
      t.string :name
      t.integer :title_type

      t.timestamps
    end
  end
end
