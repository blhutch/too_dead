$LOAD_PATH.unshift(File.dirname(__FILE__))

require "too_dead/version"
require 'too_dead/init_db'
require 'too_dead/user'
require 'too_dead/list'
require 'too_dead/item'
require 'date'

require 'pry'

module TooDead
  class Menu
   
		def login
			puts 'What is your name?'
			name = gets.chomp
			@user = User.find_or_create_by(name: name)
		end

		def delete_user(user)
			User.destroy(user.id)
		end

		def create_list(name, due_date, user_id)
			@list = List.create(name: name, due_date: due_date, finished: false, user_id: user_id)
		end

		def update_list_as_finished(name)
			@list = List.find_by_name(name)
			unless @list.nil?
				@list.finished = true
				@list.save!
			end
		end

		def find_list_by_name(name)
			@list = List.find_by_name(name)
		end 

  end
end

test = TooDead::Menu.new
user = test.login
binding.pry
list = test.create_list('My List', DateTime.now, user.id)
binding.pry
test.update_list_as_finished(list.name)
changed_list = test.find_list_by_name(list.name)
binding.pry
puts 'done'


