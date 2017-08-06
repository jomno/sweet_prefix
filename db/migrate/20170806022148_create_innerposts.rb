class CreateInnerposts < ActiveRecord::Migration
  def change
    create_table :innerposts do |t|
      t.string :title
      t.text :content
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
