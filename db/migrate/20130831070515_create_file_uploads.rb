class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :image
      t.integer :user_id

      t.integer :uploader_id

      t.timestamps
    end
  end
end
