class RenameEmployeesProjects < ActiveRecord::Migration
  def change
    rename_table :employees_projects, :assignments
  end
end
