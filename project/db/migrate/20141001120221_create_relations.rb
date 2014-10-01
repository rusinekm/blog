class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps
    end
    add_index :relations, :tag_id
    add_index :relations, :article_id
  end
end
