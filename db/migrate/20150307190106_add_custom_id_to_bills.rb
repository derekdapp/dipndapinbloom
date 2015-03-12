class AddCustomIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :custom_id, :integer
  end
end
