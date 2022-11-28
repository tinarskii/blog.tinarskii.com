class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :cover_url
      t.text :body
      t.integer :author_id
      t.text :tags
      t.text :comments

      t.timestamps
    end
  end
end
