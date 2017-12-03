class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at
  belongs_to :author
  has_many :comments
end
