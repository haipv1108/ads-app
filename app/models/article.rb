class Article < ActiveRecord::Base
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
  validates :type_id,
            presence: true

  def self.search_by_keyword(keyword)
    Article.where("fanpage LIKE '%#{keyword}%'")
        .or(Article.where("description LIKE '%#{keyword}%'"))
  end

  def self.search_by_type(type_id)
    Article.joins(:type).where(:types =>{ id: type_id})
  end

  def self.search_by_career(career_id)
    Article.joins(:careers).where(:careers => { id: career_id })
  end

  def self.search_by_purpose(purpose_id)
    Article.joins(:purposes).where(:purposes => { id: purpose_id })
  end
end