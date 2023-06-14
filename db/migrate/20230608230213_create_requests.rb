class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :status
      t.integer :urgency_level
      t.datetime :expected_completion_date

      t.timestamps
    end
  end
end
