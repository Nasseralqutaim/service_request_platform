class AddDepartmentToRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :department, null: false, foreign_key: true
  end
end
