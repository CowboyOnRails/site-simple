# encoding: utf-8
module ArticlesHelper
	def parent_article_options(article)
		root = [['без родителя',0]]
		parents = Article.where(:parent_id=>0).collect { |p| [p.name, p.id]}
		options_for_select(root+parents,article.parent_id)
	end
end
