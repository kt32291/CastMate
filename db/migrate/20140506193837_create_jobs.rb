class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :role_id
      t.integer :actor_id
      t.integer :theatre_id

      t.timestamps
    end
  end
end
