class AddTheatreTypeToTheatre < ActiveRecord::Migration
  def change
    add_column :theatres, :theatre_type, :string
  end
end
