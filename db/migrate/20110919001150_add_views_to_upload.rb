class AddViewsToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :views, :integer
  end
end
