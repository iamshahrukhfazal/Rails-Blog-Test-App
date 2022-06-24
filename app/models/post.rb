class Post < ApplicationRecord
  enum status: { published: "published", draft: "draft", unpublished: "unpublished" }
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :suggestions, dependent: :destroy

end
