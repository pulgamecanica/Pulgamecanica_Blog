class AddBgColorToTag < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :color, :string
  end
end
