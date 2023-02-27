class CreateProjectTags < ActiveRecord::Migration[7.0]
  def change
    create_table :project_tags do |t|
      t.references :project, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
