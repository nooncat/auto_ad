class FixYearColumnName < ActiveRecord::Migration
  def up
    rename_column :cars, :yearofrelease, :year_of_release
  end

  def down
  end
end
