class MakeUsersColNotNull < ActiveRecord::Migration
  def change
    change_column_null(:users, :first_name, true)
    change_column_null(:users, :last_name, true)
    change_column_null(:users, :email, true)
  end
end
