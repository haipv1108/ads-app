class Article < ApplicationRecord
  belongs_to :type
  has_many :article_purposes
  has_many :purposes, through: :article_purposes
  has_many :article_careers
  has_many :careers, through: :article_careers

  validates :fanpage,
            presence: true,
            length: { minimum: 3 }
  validates :link,
            presence: true
  validates :description,
            presence: true,
            length: { minimum: 5 }
end