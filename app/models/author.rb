class Author < ApplicationRecord
	has_many :articles
	has_many :comments
	validates :name, presence: true
end
