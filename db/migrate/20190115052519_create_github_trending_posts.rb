class CreateGithubTrendingPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :github_trending_posts do |t|

      t.timestamps
    end
  end
end
