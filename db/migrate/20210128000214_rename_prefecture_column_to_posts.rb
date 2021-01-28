class RenamePrefectureColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :prefecture, :prefecture_id
  end
end
