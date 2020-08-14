class Comment < ActiveRecord::Base 
belongs_to :deck
belongs_to :user
validates :content, presence: true  
validates :content, length: {minimum: 25}
scope :creator, -> (id) { where(user_id: id) }
end 