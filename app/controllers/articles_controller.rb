class ArticlesController < ApplicationController

  # before_action es un método que se ejecuta antes de que se ejecute cualquier acción
  # after_action es un método que se ejecuta después de que se ejecute cualquier acción (es menos común su uso)

  before_action :set_article, except: [:index, :new, :create, :from_author]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  # Recibe el formulario desde el método edit
  def update
    # Si no le paso alguno de los parametros, no se actualiza
    # A diferencia del método create (método de clase), update es un método de instancia
    @article.update(article_params)

    puts("Estoy en el método update")
    puts(@article.category_elements)

    @article.save_categories
    
    redirect_to  @article
  end

  def new
    # En el caso particular de rails una variable de instancia (@) se puede llamar desde la vista que esta llamando a esta acción
    # Mientras que si declaramos la variable sin el @ se puede usar solo en el método
    @article = Article.new
    @categories = Category.all
  end

  def create
    # Por parametros se puede pasar un hash con todos los datos del formulario
    @article = current_user.articles.create(article_params)

    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def from_author
    @user = User.find(params[:user_id])
  end


  def set_article
    puts("Estoy en el método set_article")
    # Como la variabale tiene el @ se puede usar en cualquier parte del controlador
    @article = Article.find(params[:id])
  end

  def article_params
    # Require article, dice que obligatoriamente necesitamos un parametro article
    # Y sobre este parametro que nos devuelve un Hash, vamos a decirle cuales atributos estan permitidos y cuales no.
    # Esto lo hacemos con la palabra reservada permit
    params.require(:article).permit(:title, :content, category_elements: [])
  end

end
