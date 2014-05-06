class AddPublixToRole < ActiveRecord::Migration
  def change
    add_column :roles, :publix, :boolean
  end
end
