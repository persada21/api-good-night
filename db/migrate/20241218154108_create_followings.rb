class CreateFollowings < ActiveRecord::Migration[7.2]
  def change
    create_table :followings do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :followed, null: false, foreign_key: { to_table: :users }

      t.timestamps

      t.index [:follower_id, :followed_id], unique: true
    end
  end
end