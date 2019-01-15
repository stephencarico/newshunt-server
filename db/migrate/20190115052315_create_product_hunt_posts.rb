class CreateProductHuntPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :product_hunt_posts do |t|

      t.timestamps
    end
  end
end
