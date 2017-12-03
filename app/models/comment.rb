class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  validates :content, presence: true
end
