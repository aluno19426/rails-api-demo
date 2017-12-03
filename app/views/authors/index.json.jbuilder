# app/views/authors/index.json.jbuilder
json.array! @authors, partial: 'authors/author', as: :author
