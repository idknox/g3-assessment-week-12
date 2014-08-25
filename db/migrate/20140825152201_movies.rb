class Movies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.date :year
      t.text :synopsis
    end
  end
end
