class User < ActiveRecord::Base 
    has_many :decks
has_many :comments, through: :decks
#has_many :commented_decks, through: :decks, source: :deck 
has_many :archetypes, through: :decks 

has_secure_password
end 