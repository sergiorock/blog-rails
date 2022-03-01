class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :category_articles

  # tiene muchas categorias, a traves de la tabla intermedia category_articles
  has_many :categories, through: :category_articles

  attr_accessor :category_elements

  def save_categories
    # Llega un string separado por comas. Ej: "1,2,3"
    # Convertir en un array
    # categories_array = category_elements.split(',')
    # Iterar arreglo

    return category_articles.destroy_all if category_elements.nil? || category_elements.empty?

    category_articles.where.not(category_id: category_elements).destroy_all

    category_elements.each do |category_id|
      # Por cada elemento. Crear un registro en la tabla intermedia

      # unless CategoryArticle.where(article: self, category_id: category_id).any?
      #   CategoryArticle.create(article: self, category_id: category_id)
      # end
      CategoryArticle.find_or_create_by(article: self, category_id: category_id)
    end
  end

end
