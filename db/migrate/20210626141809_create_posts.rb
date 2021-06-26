class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :thread, null: false, foreign_key: { to_table: :posts }
      t.references :postable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
