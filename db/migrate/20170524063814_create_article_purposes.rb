class CreateArticlePurposes < ActiveRecord::Migration[5.0]
  def change
    create_table :article_purposes do |t|
      t.belongs_to :article, index: true
      t.belongs_to :purpose, index: true
    end
  end
end
