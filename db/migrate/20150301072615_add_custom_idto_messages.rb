class AddCustomIdtoMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :custom_id, :integer
  end
end
