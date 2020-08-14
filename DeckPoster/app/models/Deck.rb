class Deck < ActiveRecord::Base 
    belongs_to :archetype
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    validates :name, length: {minimum: 4}
    validates :name, length: {maximum: 35}
    validates :decklist, presence: true 
validates :description, presence: true 
validates :description, length: {maximum: 200}
validates :description, length: {minimum: 50}
scope :creator, -> (id) { where(user_id: id) }
scope :commented, -> {where ("comments_count > 0")}
before_save :default_comments_count

    def archetype_name 
        self.try(:archetype).try(:name)
    end 


    def archetype_name=(name)
        archetype = Archetype.find_or_create_by(name: name)
        self.archetype = archetype
    end 

    def default_comments_count
        self.comments_count ||= 0
    end


end 