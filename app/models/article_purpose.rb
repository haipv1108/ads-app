class ArticlePurpose < ApplicationRecord
  belongs_to :article
  belongs_to :purpose
end