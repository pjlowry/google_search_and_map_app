require './ui/ui_helper'

def welcome
  puts "Welcome to the Decide-N-Go!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 's' to search for whatever"
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
    when 's'
      search
    when 'list'
      list
    when 'e'
      exit
    else
      invalid
      menu
    end
  end
end

def search
  puts "Please enter an address:"
  address = gets.chomp
  puts "What do you want to search for?"
  keyword = gets.chomp
  puts "How far do you want your search radius in meters?"
  radius = gets.chomp
  search = Search.new(:keyword => keyword, :address => address, :radius => radius)
  results_array = search.results
  list(results_array, search)
end

def list(results_array, search)
  results_array
  puts "Here are your search results:"
  results_array.each_with_index do |result, i|
    puts "#{i + 1}."
    puts "Name: #{result.name}"
    puts "Address: #{result.address}\n\n"
  end
  puts "Would you like to pick a place or pick a random one? 'p' for place, 'r' for random."
  choice = gets.chomp
  case choice
    when 'p'
      pick(results_array, search)
    when 'r'
      random(results_array, search)
    else
      invalid
      list(results_array, search)
  end
end

def pick(results_array, search)
  puts "Please select the number of the destination:"
  choice = gets.chomp
  puts "\n\n"
  direction = Direction.new(results_array[choice.to_i - 1], search)
  direction.routes.each {|route| puts route }
  puts "\n\n"
end

def random(results_array, search)
  result = results_array[rand(results_array.length - 1)]
  direction = Direction.new(result, search)
  puts "\n\n"
  puts "You are going here #{result.name}"
  direction.routes.each {|route| puts route }
  puts "\n\n"
end

def invalid
  puts "Try again Braj!"
end

welcome