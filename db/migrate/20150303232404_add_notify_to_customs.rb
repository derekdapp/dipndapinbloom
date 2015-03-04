class AddNotifyToCustoms < ActiveRecord::Migration
  def change
    add_column :customs, :notify, :boolean, :default => true
  end
end
