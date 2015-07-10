class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :postid
      t.text :postidcontent
      t.text :address
      t.string :locality
      t.string :city
      t.string :problem
      t.boolean :postvalidity
      t.boolean :resolution
      t.text :photo

      t.timestamps null: false
    end
  end
end
