
# address-bloc welcome Ruby file

require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"

puts " "
puts "Welcome to AddressBloc!"
puts " "

menu.main_menu
