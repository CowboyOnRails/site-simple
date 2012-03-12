class MetaitemsController < ApplicationController
  before_filter :find_article

  def edit
    if @article.metaitem.present?
      @metaitem = @article.metaitem
    else
      @metaitem = @article.build_metaitem
    end
  end
 
  def update
    if @article.metaitem.present?
      @metaitem = @article.metaitem
      @metaitem.attributes = params[:metaitem]
    else
      @metaitem = @article.build_metaitem(params[:metaitem])
    end
    
    if @metaitem.save
      flash[:notice] = "Saved"
    else
      flash[:alert] = "Error"
    end
    
    redirect_to show_article_path(@article)
  end

  private
    def find_article
      @article = Article.find(params[:article_id])
    end
end
