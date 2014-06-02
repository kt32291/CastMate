class CreateAuditions < ActiveRecord::Migration
  def change
    create_table :auditions do |t|
      t.string :name
      t.text :description
      t.integer :theatre_id
      t.boolean :equity
      t.date :audition_start
      t.date :audition_end
      t.integer :play_id

      t.timestamps
    end
  end
end
