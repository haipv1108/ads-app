class CreateCareer < ActiveRecord::Migration[5.0]
  def change
    create_table :careers do |t|
      t.string :name
    end
  end
end

