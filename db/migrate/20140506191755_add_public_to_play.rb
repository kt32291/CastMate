class AddPublicToPlay < ActiveRecord::Migration
  def change
    add_column :plays, :public, :boolean
  end
end
