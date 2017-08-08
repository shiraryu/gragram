class AddPictureImageToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :pictureimage, :string
  end
end
