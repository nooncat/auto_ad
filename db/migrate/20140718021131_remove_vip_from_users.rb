class RemoveVipFromUsers < ActiveRecord::Migration
  def change 
    remove_column :cars, :vip
  end
end
