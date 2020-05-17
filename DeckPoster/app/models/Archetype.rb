class Archetype < ActiveRecord::Base 
has_many :decks
has_many :users, through: :decks
end 
