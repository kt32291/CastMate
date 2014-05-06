class RemovePublicFromRole < ActiveRecord::Migration
  def change
    remove_column :roles, :public, :boolean
  end
end
