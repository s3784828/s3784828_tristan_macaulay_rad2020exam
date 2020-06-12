class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :offset
      t.datetime :time
      t.timestamps
    end
  end
end
