class CreateArticleCareers < ActiveRecord::Migration[5.0]
  def change
    create_table :article_careers do |t|
      t.belongs_to :article, index: true
      t.belongs_to :career, index: true
    end
  end
end
