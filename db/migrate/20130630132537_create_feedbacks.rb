class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :contact
      t.string :content
      t.boolean :checkf, default: false

      t.timestamps
    end
    add_index :feedbacks, :created_at
  end
end
