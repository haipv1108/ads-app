class CreateArticle < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :fanpage
      t.string :link
      t.text :description
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end