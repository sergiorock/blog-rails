class ArticlesController < ApplicationController
  def new
    # En el caso particular de rails una variable de instancia (@) se puede llamar desde la vista que esta llamando a esta acción
    # Mientras que si declaramos la variable sin el @ se puede usar solo en el método
    @article = Article.new
  end

  def create
    @article = Article.create(title: params[:article][:title])
    render json: @article
  end
end
