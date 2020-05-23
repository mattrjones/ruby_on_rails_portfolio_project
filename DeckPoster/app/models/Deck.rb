class Deck < ActiveRecord::Base 
    belongs_to :archetype
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments

    def archetype_name 
        self.try(:archetype).try(:name)
    end 

    def archetype_name=(name)
        archetype = Archetype.find_or_create_by(name: name)
        self.archetype = archetype
    end 

end 