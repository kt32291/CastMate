class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :character_name
      t.integer :play_id

      t.timestamps
    end
  end
end
