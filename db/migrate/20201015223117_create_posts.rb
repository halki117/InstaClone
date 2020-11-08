class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image, null: false
      t.string :decription
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
