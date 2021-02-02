class AddPrefectureIdToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :prefecture_id, :integer
  end
end
