class CreateCallsheets < ActiveRecord::Migration
  def change
    create_table :callsheets do |t|
      t.integer :user_id
      t.integer :audition_id
      t.string :role_name
      t.string :status
      t.text :conflicts
      t.text :notes
      t.string :wave
      t.string :rec_by

      t.timestamps
    end
  end
end
