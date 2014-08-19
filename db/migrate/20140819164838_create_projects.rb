class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :done, :boolean
      t.column :start_date, :datetime
      t.column :due_date, :datetime

      t.timestamps
    end
  end
end
