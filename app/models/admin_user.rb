class AdminUser < ApplicationRecord
	#if you change the name you can either do self.table_name or change the class name - class AdminUser
	#self.table_name = "admin_users"
	#defining associations
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

end
