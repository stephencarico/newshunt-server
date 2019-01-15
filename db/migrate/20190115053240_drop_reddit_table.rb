class DropRedditTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:reddit)
  end
end
