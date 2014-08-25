class FixYear < ActiveRecord::Migration
  def change
    remove_column :movies, :year, :date
    add_column :movies, :year, :string
  end
end
