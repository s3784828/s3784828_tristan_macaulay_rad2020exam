class AddDefaultToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :default, :boolean
  end
end
