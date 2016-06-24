class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
			t.string 'name', null: false
			t.string 'creater', null: false
			t.integer 'cleared', null: false, default: 0
			t.integer 'min_cost'
			t.column 'map_data', :json, null: false
      t.timestamps
    end
  end
end
