class DropGithubTrendingTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:github_trending)
  end
end
