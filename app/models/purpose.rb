class Purpose < ApplicationRecord
  has_many :article_purposes
  has_many :articles, through: :article_purposes
  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 50 }
end