class CreateTheatres < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.string :name
      t.string :city
      t.string :type

      t.timestamps
    end
  end
end
