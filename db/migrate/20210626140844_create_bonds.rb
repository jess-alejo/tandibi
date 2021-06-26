class CreateBonds < ActiveRecord::Migration[6.1]
  def change
    create_table :bonds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.string :state, null: false

      t.timestamps
    end

    add_index :bonds, [:user_id, :friend_id], unique: true
  end
end
