class AddDecksPostedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :decks_posted, :integer
  end
end
