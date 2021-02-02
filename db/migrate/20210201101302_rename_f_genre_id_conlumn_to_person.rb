class RenameFGenreIdConlumnToPerson < ActiveRecord::Migration[6.0]
  def change
    rename_column :people, :f_genre_id, :genre_id
  end
end
