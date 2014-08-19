class ChangeEmployeeToAddProjectId < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.column :project_id, :int
    end
  end
end
