class CreateTrends < ActiveRecord::Migration[7.0]
  def change
    create_table :trends do |t|
      t.string :keyword,     null: false, unique:  true
      t.integer :searches,   default: 0

      t.timestamps
    end
  end
end
