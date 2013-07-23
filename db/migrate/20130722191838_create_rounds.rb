class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :player_id, null: false
      t.integer :game_id,   null: false
    end
    add_index(:rounds, [:player_id, :game_id], :unique => true, :name => 'unique_names')
  end
end
