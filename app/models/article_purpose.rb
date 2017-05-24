class ArticlePurpose < ActiveRecord::Base
  belongs_to :article
  belongs_to :purpose
end