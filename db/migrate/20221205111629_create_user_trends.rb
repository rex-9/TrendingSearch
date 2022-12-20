class CreateUserTrends < ActiveRecord::Migration[7.0]
  def change
    create_table :user_trends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trend, null: false, foreign_key: true

      t.timestamps
    end
  end
end