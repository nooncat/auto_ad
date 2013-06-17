class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :cars, :carname, :name
  end

  def self.down
  end
end
