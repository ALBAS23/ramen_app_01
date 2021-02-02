class ChangeColumnToPeople < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :people, :gender, :string, null: true
    end
    def down
      change_column :people, :gender, :string, null: false
    end
  end
end
