class AddTypeIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :type_id, :integer
  end
end
