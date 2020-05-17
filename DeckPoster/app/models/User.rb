class User < ActiveRecord::Base 
    has_many :decks
has_many :comments, through: :decks
has_secure_password
end 