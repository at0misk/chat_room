class AddCategoriesToVideos < ActiveRecord::Migration[5.0]
  def change
	add_reference :videos, :category, foreign_key: true
  end
end
