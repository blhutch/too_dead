class CreateItems < ActiveRecord::Migration
	def up
		create_table :items do |t|
			t.datetime :due_date
			t.string :item_name
			t.boolean :done
		end
	end

	def	down
		drop_table :items
	end
end
