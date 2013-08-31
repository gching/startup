class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.integer :user_id
      t.integer :author_id
      t.datetime :ends_at
      t.boolean :all_day, default: false

      t.timestamps
    end
    add_index :events, [:author_id, :user_id, :created_at]
  end
end
