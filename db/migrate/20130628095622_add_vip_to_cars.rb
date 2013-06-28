class AddVipToCars < ActiveRecord::Migration
  def change
    add_column :cars, :vip, :boolean, default: false
  end
end
