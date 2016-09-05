# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##################################################################################################
# create roles
#

roles = ['Administrator','Cashier','Clerk','Accountant']
puts '### --------------------------------------------------- '
roles.each do |role|
	set_role = UserRole.new(role: role)
	if set_role.valid?
		set_role.save
		puts "### User Role: #{role} created successfully            "
	end
end
puts "### --------------------------------------------------- \n\n\n"

#
#
##################################################################################################


##################################################################################################
# create admin login credentials
#

admin = User.new(username: 'admin', password: 'test', password_confirmation: 'test',
                 user_role_id: UserRole.find_by_role('Administrator').id)
if admin.valid?
	admin.save
	puts '### -------------------------------------------------------- ###'
	puts '### Admin login credentials successfully written to Database ###'
	puts "### Username: 'admin'                                        ###"
	puts "### Password: 'test'                                         ###"
	puts "### User Role: 'Administrator'                               ###"
	puts '### -------------------------------------------------------- ###'
else
	puts 'Failed to write admin credentials to Database.'
end

#
#
##################################################################################################
