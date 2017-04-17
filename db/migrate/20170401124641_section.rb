class Section < ActiveRecord::Migration[5.0]
  def change
  	
  	t.integer :page_id
  	t.string :name
  	t.integer :position
  	t.boolean :visible
  	t.string :content_type
  	t.text :content
  end
end
