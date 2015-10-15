class AddRoleToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :role, :integer, :default => 0
  end
end
