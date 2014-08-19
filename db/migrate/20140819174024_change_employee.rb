class ChangeEmployee < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.column :division_id, :int
    end
  end
end
