class AddParsedToSongs < ActiveRecord::Migration
  def change
    add_column(:songs, :parsed, :text)
  end
end


