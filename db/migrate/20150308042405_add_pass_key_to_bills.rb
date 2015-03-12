class AddPassKeyToBills < ActiveRecord::Migration
  def change
    add_column :bills, :pass_key, :string
  end
end
