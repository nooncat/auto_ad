class ChangeContentTypeOfFeedbacks < ActiveRecord::Migration
  def up
    change_column :feedbacks, :content, :text, :limit => nil
  end

  def down
    change_column :feedbacks, :content, :string
  end
end
