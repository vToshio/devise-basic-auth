class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
