require_relative "../lib/pokemonscraper.rb"
require_relative "../lib/pokemon.rb"
require 'nokogiri'

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
    puts "Would you like to know more about #{rando_poke.name}? Y/N"
    user_input = gets.chomp
    if user_input == "Y"
      puts " - Belongs to: #{rando_poke.pokemon_generation}"
      puts " - Pokedex # #{rando_poke.pokedex_number}"
      puts " - Type: #{rando_poke.pokemon_type}"
      puts " - Details: #{rando_poke.description}"
    end
    run
    end


  def show_all
    Pokemon.all.each do |pokemon|
      puts "#{pokemon.name.upcase}"
      puts " - Belongs to: #{pokemon.pokemon_generation}"
      puts " - Pokedex # #{pokemon.pokedex_number}"
      puts " - Type: #{pokemon.pokemon_type}"
      puts " - Details: #{pokemon.description}"
    end
    run
  end

  def show_pokedex
    @@pokedex.each do |pokemon|
      puts pokemon.name
    end
    run
  end

  def run
    make_pokedex
    add_details
    puts "Hello! Welcome to Pokemon-NO-GO"
    puts "What would you like to do?"
    puts "'catch': to catch a new pokemon"
    puts "'see all': to see all catchable pokemons to catch"
    puts "'pokedex': to see your current pokedex"
    puts "'exit': to quit"
    user_input = gets.chomp

    case user_input
      when 'catch'
        catch_em
      when 'see all'
        show_all
      when 'pokedex'
        show_pokedex
      when 'exit'
        return
      else
        run
    end
  end
end