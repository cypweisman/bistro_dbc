class RemoveNullConstraintFromIsAdminInUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :is_admin, true
  end
end
