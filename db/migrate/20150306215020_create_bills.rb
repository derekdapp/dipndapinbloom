class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.boolean :is_paid, :default => false
      t.integer :total, :default => 0

      t.timestamps
    end
  end
end
