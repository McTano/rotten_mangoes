class ChangeUsersAdminToBoolean < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :admin, :integer
      t.boolean :admin, default: false
    end
  end
end
