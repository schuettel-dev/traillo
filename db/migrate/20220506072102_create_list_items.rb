class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.string :title
      t.integer :list_position

      t.timestamps
    end
  end
end
