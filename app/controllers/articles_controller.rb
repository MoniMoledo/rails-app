class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params) 
        if @article.save
            flash[:notice] = "Article successfully created"
            redirect_to article_path(@article)
        else
            render :new
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find_by(title: article_params[:title])
        updated_article = @article.update(article_params)
        if updated_article!
            flash[:notice] = "Article successfully updated"
            redirect_to article_path(updated_article)
        else
            render :edit
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def detroy
        @article = Article.find(params[:id])
        @article.detroy
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
