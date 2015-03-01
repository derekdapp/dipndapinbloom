class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :canvas_size
      t.text :info
      t.string :email
      t.string :name
      t.string :pass_key

      t.timestamps
    end
  end
end
