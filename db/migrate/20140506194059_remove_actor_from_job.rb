class RemoveActorFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :actor_id, :integer
  end
end
