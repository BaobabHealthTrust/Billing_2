class User < ActiveRecord::Base
	validates :username, presence: true
	has_secure_password
	self.table_name = 'users'
end
