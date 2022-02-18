class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  # Recibe el formulario desde el método edit
  def update
    @article = Article.find(params[:id])

    # Si no le paso alguno de los parametros, no se actualiza
    # A diferencia del método create (método de clase), update es un método de instancia
    @article.update(title: params[:article][:title], content: params[:article][:content])
    
    redirect_to  @article
  end

  def new
    # En el caso particular de rails una variable de instancia (@) se puede llamar desde la vista que esta llamando a esta acción
    # Mientras que si declaramos la variable sin el @ se puede usar solo en el método
    @article = Article.new
  end

  def create
    @article = Article.create(title: params[:article][:title], content: params[:article][:content])
    render json: @article
  end
end
