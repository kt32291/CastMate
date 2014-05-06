class AddStatsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :equity, :string
    add_column :users, :gender, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :hair, :string
    add_column :users, :eyes, :string
    add_column :users, :vocal_range, :string
    add_column :users, :headshot, :string
    add_column :users, :resume, :string
    add_column :users, :theatre, :string
  end
end
