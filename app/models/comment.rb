class Comment < ApplicationRecord
  has_ancestry
  belongs_to :article

  validates :text, presence: true, length: { minimum: 3, maximum: 3000 }
end
