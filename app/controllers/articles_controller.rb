# encoding: utf-8
class ArticlesController < ApplicationController
  
  respond_to :html
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  
  def edit
    @article = Article.find(params[:id])
  end

 
  def create
    @article = Article.new(params[:article])

    if @article.save
      flash[:notice] = "Раздел успешно создан"
      redirect_to @article
    else
      flash[:alert] = "При создании раздела произошли ошибки"
      render :action => "new"
    end
  end


  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      flash[:notice] = "Раздел успешно обновлен"
      redirect_to @article
    else
      flash[:alert] = "При обновлении раздела произошли ошибки"
      render :action => "edit"
    end
  end

  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_url
  end
end
