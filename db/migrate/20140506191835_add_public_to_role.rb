class AddPublicToRole < ActiveRecord::Migration
  def change
    add_column :roles, :public, :boolean
  end
end
