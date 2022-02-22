class ArticlesController < ApplicationController

  # before_action es un método que se ejecuta antes de que se ejecute cualquier acción
  # after_action es un método que se ejecuta después de que se ejecute cualquier acción (es menos común su uso)

  before_action :set_article, except: [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  # Recibe el formulario desde el método edit
  def update
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

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def set_article
    puts("Estoy en el método set_article")
    # Como la variabale tiene el @ se puede usar en cualquier parte del controlador
    @article = Article.find(params[:id])
  end

end
