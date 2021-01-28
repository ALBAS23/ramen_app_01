class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string      :menu, null: false
      t.string      :store, null: false
      t.integer     :price, null: false
      t.integer     :genre, null: false
      t.string      :word,  null: false
      t.integer     :prefecture, null: false
      t.string      :place
      # t.references   :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
