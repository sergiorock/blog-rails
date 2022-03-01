class Category < ApplicationRecord
  has_many :category_articles

  # tiene muchos articulos, a traves de la tabla intermedia category_articles
  has_many :articles, through: :category_articles
end
