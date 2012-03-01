class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.integer :views, :default => 0
      t.has_attached_file :image
      t.timestamps
    end
  end
end
