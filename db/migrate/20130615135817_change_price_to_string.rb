class ChangePriceToString < ActiveRecord::Migration
  def self.up
    change_column :cars, :price, :string
  end

  def self.down
    change_column :cars, :price, :integer
  end
end
