class UserRole < ActiveRecord::Base
	self.table_name = 'user_roles'
	belongs_to :user
end
