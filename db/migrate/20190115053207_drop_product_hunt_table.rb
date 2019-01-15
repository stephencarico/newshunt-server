class DropProductHuntTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:product_hunt)
  end
end
