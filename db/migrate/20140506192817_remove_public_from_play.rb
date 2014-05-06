class RemovePublicFromPlay < ActiveRecord::Migration
  def change
    remove_column :plays, :public, :boolean
  end
end
