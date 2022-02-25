class AddPictureUrlToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :picture_url, :text
  end
end
