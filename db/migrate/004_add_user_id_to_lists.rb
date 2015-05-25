class AddUserIdToLists < ActiveRecord::Migration
	def up
		add_column :lists, :user_id, :integer
	end

	def down
		remove_column :lists, :user_id
	end
end
