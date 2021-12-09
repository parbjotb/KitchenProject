class UpdateProductsAddAmountAndChangePriceDataType < ActiveRecord::Migration[6.1]
  def change
    # change_column :table_name, :column_name, :date
    change_column :products, :price, :decimal
    add_column :products, :quantity, :integer
  end
end
