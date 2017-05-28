class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :kind
      t.string :url
      t.string :slug
      t.string :extended_slug
      t.string :description

      t.timestamps null: false
    end
  end
end
