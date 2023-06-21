class ChangeRequestsDepartmentIdToBeNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :requests, :department_id, true
  end
end
