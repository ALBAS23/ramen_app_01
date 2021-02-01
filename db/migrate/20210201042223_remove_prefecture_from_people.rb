class RemovePrefectureFromPeople < ActiveRecord::Migration[6.0]
  def change
    remove_column :people, :prefecture, :integer
  end
end
