class AddTimeStatusToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :time_status, :string
  end
end
