class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :subname
      t.string :subname_en
      t.string :url
      t.text :description
      t.text :description_en
      t.boolean :website, default: true
      t.boolean :design, default: false
      t.timestamps
    end
  end
end
