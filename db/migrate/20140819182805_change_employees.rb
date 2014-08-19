class ChangeEmployees < ActiveRecord::Migration
  def change
      remove_column :employees, :project_id, :int
  end
end
