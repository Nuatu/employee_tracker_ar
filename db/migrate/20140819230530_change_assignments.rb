class ChangeAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :contribution, :string
  end
end
