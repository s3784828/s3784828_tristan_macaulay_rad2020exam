class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.float :offset
      t.string :city_name

      t.timestamps
    end
  end
end
