class CreateReviews < ActiveRecord::Migration
	def change
    create_table :reviews do |t|
      t.string :name
      t.string :feedback
      t.integer :user_id


      t.timestamps
    end
  end

end
