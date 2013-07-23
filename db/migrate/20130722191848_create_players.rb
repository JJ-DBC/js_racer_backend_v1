class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, :null => false, :unique => true
    
      t.timestamps
    end
  end
end
