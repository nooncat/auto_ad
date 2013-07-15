class ChangeColumnName < ActiveRecord::Migration
  def self.up
    rename_column :users, :name, :login
  end

  def self.down
  end
end
