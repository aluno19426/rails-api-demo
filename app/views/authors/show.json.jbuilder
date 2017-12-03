# app/views/api/authors/show.json.jbuilder

json.extract! @author, :id, :name, :created_at

json.articles @author.articles do |article|
  json.article_title article.title
  json.article_body article.content
  json.url author_article_url(@author.id, article.id) # isto usa prefixos das rotas
end

