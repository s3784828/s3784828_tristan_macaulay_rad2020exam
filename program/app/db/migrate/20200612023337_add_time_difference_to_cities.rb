class AddTimeDifferenceToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :time_difference, :float
  end
end
