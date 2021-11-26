class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.bigint :price
      t.text :description
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
