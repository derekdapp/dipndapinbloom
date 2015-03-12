class AddTipAndSubtotalToBills < ActiveRecord::Migration
  def change
    add_column :bills, :tip, :integer, :default => 0
    add_column :bills, :subtotal, :integer, :default => 0
  end
end
