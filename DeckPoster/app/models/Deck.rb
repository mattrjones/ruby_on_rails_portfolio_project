class Deck < ActiveRecord::Base 
    belongs_to :archetype
    belongs_to :user
    has_many :comments
end 