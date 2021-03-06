require_relative "../lib/pokemonscraper.rb"
require_relative "../lib/pokemon.rb"
require 'nokogiri'
require 'open-uri'

class Play
@@pokedex = []
BASE_PATH = "https://rankedboost.com"
  def make_pokedex
    pokemon_array = PokeScraper.scrape_pokemon
    Pokemon.create_from_pokedex(pokemon_array)
  end

  def add_details
    Pokemon.all.each do |pokemon|
      deets = PokeScraper.scrape_link(BASE_PATH + pokemon.profile_url)
      pokemon.add_poke_card(deets)
    end
  end

  def catch_em
    rando_poke = Pokemon.all.sample
    puts "Nice throw! You caught #{rando_poke.name}!"
    @@pokedex << rando_poke
    puts "Would you like to know more about #{rando_poke.name}? y/n"
    user_input = gets.chomp
    if user_input == "y"
      puts " - Belongs to: #{rando_poke.pokemon_generation}"
      puts " - Pokedex # #{rando_poke.pokedex_number}"
      puts " - Type: #{rando_poke.pokemon_type}"
      puts " - Details: #{rando_poke.description}"
    end
    puts "Would you like to see your pokedex? y/n"
    user_input2 = gets.chomp
    if user_input2 == "y"
      show_pokedex
    end
  end

  def show_all
    Pokemon.all.each do |pokemon|
      puts "#{pokemon.name.upcase}"
      puts " - Belongs to: #{pokemon.pokemon_generation}"
      puts " - Pokedex # #{pokemon.pokedex_number}"
      puts " - Type: #{pokemon.pokemon_type}"
      puts " - Details: #{pokemon.description}"
    end
  end

  def show_pokedex
    if @@pokedex.length > 0
      puts "   POKEDEX   "
      @@pokedex.each do |pokemon|
        puts "# #{pokemon.pokedex_number} - #{pokemon.name.upcase}"
        puts " - Belongs to: #{pokemon.pokemon_generation}"
        puts " - Pokedex # #{pokemon.pokedex_number}"
        puts " - Type: #{pokemon.pokemon_type}"
        puts " - Details: #{pokemon.description}"
      end #end do 
    else 
      puts "Sorry, you haven't caught any Pokemon yet..."
      puts "Would you like to start? y/n"
      user_input2 = gets.chomp
      if user_input2 == 'y'
        catch_em
      end #end user2 
    end #end pokedex.len 
  end # pokedex method 
  
  def find_pokemon_by_name
    puts "Please, type the name of the Pokemon you'd like to see"
    user_input = gets.chomp
    Pokemon.all.each do |pokemon|
      if user_input.upcase == pokemon.name.upcase
        puts "#{pokemon.name.upcase}"
        puts " - Belongs to: #{pokemon.pokemon_generation}"
        puts " - Pokedex # #{pokemon.pokedex_number}"
        puts " - Type: #{pokemon.pokemon_type}"
        puts " - Details: #{pokemon.description}"
      end
    end
    if Pokemon.all.any? {|pokemon| user_input.upcase == pokemon.name.upcase} == false
      puts "Oops! I couldn't find that Pokemon... To try again, type 'find'"
    end
  end

  def run
    make_pokedex
    add_details
    puts "Hello! Welcome to Pokemon-NO-GO"
    run_again
  end

  def run_again
    puts "'catch': to catch a new pokemon"
    puts "'see all': to see all catchable pokemons to catch"
    puts "'find': find the data for any pokemon on the list, by name"
    puts "'pokedex': to see your current pokedex"
    puts "'exit': to quit"
    user_input = gets.chomp

    case user_input
      when 'catch'
        
        catch_em
        puts " "
      when 'see all'
        show_all
        puts " "
      when 'pokedex'
        show_pokedex
        puts " "
      when 'find'
        find_pokemon_by_name
        puts " "
      when 'exit'
        return
    end
    run_again
  end
  
end