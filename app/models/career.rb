class Career < ApplicationRecord
  has_many :article_careers
  has_many :articles, through: :article_careers
  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 50 }
end