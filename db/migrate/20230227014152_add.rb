class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :bg_choice, :integer
  end
end
