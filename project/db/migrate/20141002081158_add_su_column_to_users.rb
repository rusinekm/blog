class AddSuColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :su, :boolean
  end
end
