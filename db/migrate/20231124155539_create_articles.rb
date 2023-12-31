class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :description
      t.string :url
      t.string :url_to_image
      t.string :published_at
      t.string :content
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
