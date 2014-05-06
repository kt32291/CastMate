class AddPublixToPlay < ActiveRecord::Migration
  def change
    add_column :plays, :publix, :boolean
  end
end
