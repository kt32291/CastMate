class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :title
      t.string :type_of_show
      t.string :author
      t.string :music_by

      t.timestamps
    end
  end
end
