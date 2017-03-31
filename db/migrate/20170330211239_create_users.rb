class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.column "first_name", :string, :limit => 25
      #or to make it easier, a shorter syntax
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false 
      t.string "password", :limit => 40
      t.timestamps
    end

    def down
    	drop_table :users
    end
  end
end
