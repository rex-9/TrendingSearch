class CreateTrends < ActiveRecord::Migration[7.0]
  def change
    create_table :trends do |t|
      t.string :keyword,       null: false, unique:  true
      t.integer :popularity,   default: 1

      t.timestamps
    end
  end
end
