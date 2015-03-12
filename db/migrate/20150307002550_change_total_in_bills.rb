class ChangeTotalInBills < ActiveRecord::Migration
  def change
  	change_column :bills, :total, :float, :default => 0.0
  	change_column :bills, :subtotal, :float, :default => 0.0
  	change_column :bills, :tip, :float, :default => 0.0
  end
end
