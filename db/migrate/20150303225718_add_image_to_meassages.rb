class AddImageToMeassages < ActiveRecord::Migration
  def change
    add_column :messages, :image, :string
  end
end
