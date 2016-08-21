class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title,        null: false
      t.string :url,          null: false
      t.string :type
      t.string :description

      t.timestamps(null: false)
    end
  end
end
