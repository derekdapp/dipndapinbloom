class AddStatusToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :status, :string
  end
end
