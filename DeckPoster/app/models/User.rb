class User < ActiveRecord::Base 
    has_many :decks
has_many :comments, through: :decks 
has_many :archetypes, through: :decks
before_save :default_name 


def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash[‘info’][‘email’]).first_or_create do |u|
    u.name = auth_hash[‘info’][‘name’]
    u.password = SecureRandom.hex
    end
   end

   def default_name
    self.name ||= ""
   end 
end 