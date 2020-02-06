class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.boolean :is_active, default: false, null: false
      t.timestamps
    end
  end
end
