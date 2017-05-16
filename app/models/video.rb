class Video < ApplicationRecord
	belongs_to :category
	mount_uploader :vfile, VfileUploader
end
