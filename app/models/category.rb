class Category < ApplicationRecord
	has_many :videos
	has_many :specials
end
