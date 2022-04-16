class RemoveContentFromElements < ActiveRecord::Migration[7.0]
  def change
    remove_column :elements, :content
  end
end
