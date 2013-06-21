class AddBodyTypeAndEngineAndEngineTypeAndTransmissionAndColorAndMileageToCar < ActiveRecord::Migration
  def change
    add_column :cars, :body_type, :string
    add_column :cars, :engine, :string
    add_column :cars, :engine_type, :string
    add_column :cars, :transmission, :string
    add_column :cars, :color, :string
    add_column :cars, :mileage, :string
  end
end
