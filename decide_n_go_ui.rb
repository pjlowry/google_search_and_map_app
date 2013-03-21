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
    end
  end
end

def search
  puts "Enter your latitude coordinate here:"
  latitude = gets.chomp
  puts "Enter your longitude coordinate here:"
  longitude = gets.chomp
  puts "What do you want to search for?"
  keyword = gets.chomp
  puts "How far do you want your search radius in meters?"
  radius = gets.chomp
  search = Search.new(:keyword => keyword, :longitude => longitude, :latitude => latitude, :radius => radius)
  p search
  p results_array = search.results
  list(results_array)
end

def list(results_array)
  p results_array
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
      pick(results_array)
    when 'r'
      random(results_array)
    else
    invalid
  end
end

def pick(results_array)
  puts "Please select the number of the destination:"
  choice = gets.chomp
  direction = Direction.new(result_array[choice - 1])
end

def random(results_array)
  puts "You are going here .........."
end



welcome