class RenameCutomerStatusColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :cutomer_status, :customer_status
  end
end
