class AddStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :ethnic_appearance, :string
    add_column :users, :agency, :string
    add_column :users, :phone, :string
    add_column :users, :special_skills, :text
    add_column :users, :age_range, :string
  end
end
