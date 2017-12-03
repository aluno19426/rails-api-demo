class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :author
  belongs_to :article
end
