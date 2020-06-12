class CreateZones < ActiveRecord::Migration[5.2]
  def change
    create_table :zones do |t|
      t.string :value
      t.string :abbr
      t.integer :offset
      t.boolean :isdst
      t.string :text
      t.string :utc, default: [], array:true

      t.timestamps
    end
  end
end
