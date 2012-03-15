# encoding: utf-8
module ArticlesHelper
	def parent_article_options(article)
		root = [['без родителя',0]]
		parents = Article.where(:parent_id=>0, :top => false)
		if article.try(:id).present?
			parents = parents.select { |a| a.id != article.id }		
		end
		options_for_select(root + parents.collect { |p| [p.name, p.id]},article.try(:parent_id))
	end
end
