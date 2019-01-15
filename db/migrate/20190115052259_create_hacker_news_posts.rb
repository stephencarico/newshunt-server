class CreateHackerNewsPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :hacker_news_posts do |t|

      t.timestamps
    end
  end
end
