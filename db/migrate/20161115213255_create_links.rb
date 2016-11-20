class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.string :name
      t.text :description
      t.references :category, foreign_key: true
      t.string :facebook
      t.string :email

      t.timestamps
    end
  end
end
