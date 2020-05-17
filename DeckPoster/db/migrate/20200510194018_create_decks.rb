class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :decklist
      t.string :description 
      t.integer :user_id 
      t.integer :archetype_id
    end
  end
end
