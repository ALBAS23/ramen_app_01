class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string  :gender, null: false
      t.integer :prefecture, null: false
      t.string  :f_store_one, null: false
      t.string  :f_store_two
      t.string  :f_store_three
      t.integer :f_genre_id
      t.string  :f_topping
      t.text    :self_introduction
      t.references :user, null: false, foreign_key: true
      t.timestamps  
    end
  end
end
