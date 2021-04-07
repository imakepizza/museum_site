class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.datetime :published_at
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
