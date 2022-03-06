class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
