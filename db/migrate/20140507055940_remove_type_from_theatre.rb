class RemoveTypeFromTheatre < ActiveRecord::Migration
  def change
    remove_column :theatres, :type, :string
  end
end
