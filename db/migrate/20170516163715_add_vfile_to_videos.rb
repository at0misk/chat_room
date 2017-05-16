class AddVfileToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :vfile, :string
  end
end
