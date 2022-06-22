class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    belongs_to :parent, class_name:"Comment", optional: true
    
    has_many :comments, foreign_key: "parent_id"
    has_many :likes, as: :likeable
    has_many :reports, as: :reportable

end
