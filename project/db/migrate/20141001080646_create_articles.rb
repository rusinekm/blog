class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.date :date
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
