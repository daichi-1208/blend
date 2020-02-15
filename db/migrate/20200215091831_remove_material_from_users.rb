class RemoveMaterialFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :material, :string
    remove_column :posts, :quantity, :string
  end
end
