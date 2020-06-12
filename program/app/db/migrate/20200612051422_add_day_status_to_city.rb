class AddDayStatusToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :day_status, :string
  end
end
