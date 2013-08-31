class CreateUser < ActiveRecord::Migration
	def change
		create_table(:users) do |t|
		      ## Database authenticatable
		      t.string :name,              :null => false, :default => ""
		      t.timestamps
		end

	end
end
