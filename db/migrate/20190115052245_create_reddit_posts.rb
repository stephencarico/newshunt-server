class CreateRedditPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :reddit_posts do |t|

      t.timestamps
    end
  end
end
