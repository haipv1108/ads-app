class Type < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 50 }
end