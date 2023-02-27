class CreateReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :references do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.text :link
    end
  end
end
