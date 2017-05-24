class ArticleCareer < ActiveRecord::Base
  belongs_to :article
  belongs_to :career
end