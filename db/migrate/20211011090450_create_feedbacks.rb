class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :author
      t.string :source
      t.string :source_url
      t.text :content
      t.text :content_en
      t.integer :project_id
      t.timestamps
    end
  end
end
