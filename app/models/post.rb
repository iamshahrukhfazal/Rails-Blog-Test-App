class Post < ApplicationRecord
  enum status: { published: "published", draft: "draft", unpublished: "unpublished" }
  
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
  has_many :reports, as: :reportable

end
