class Like < ApplicationRecord
    belongs_to :user
    belongs_to :likeable, polymorphic: true
    validates :user_id, uniqueness:{scope: [:likeable_id,:likeable_type]} 
    
    def self.lastLikes 
        Like.last(10)
    end
    # Ex:- scope :active, -> {where(:active => true)}

end
