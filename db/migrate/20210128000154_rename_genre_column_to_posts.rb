class RenameGenreColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :genre, :genre_id
  end
end
