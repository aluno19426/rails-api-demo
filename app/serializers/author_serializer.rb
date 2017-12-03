class AuthorSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers
	attributes :id, :name
	has_many :articles

	attribute :links do
		id = object.id
		{
			self: author_path(id),
			articles: author_articles_path(author_id: id)
		}
	end
end

