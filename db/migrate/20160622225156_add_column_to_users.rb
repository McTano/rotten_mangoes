class AddColumnToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.column :admin, :integer
    end
  end
end
