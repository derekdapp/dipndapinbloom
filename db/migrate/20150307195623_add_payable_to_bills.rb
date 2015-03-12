class AddPayableToBills < ActiveRecord::Migration
  def change
    add_column :bills, :payable, :boolean, :default => false
  end
end
