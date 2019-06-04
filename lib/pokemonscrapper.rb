require 'pry'
require 'open-uri'
require 'nokogiri'

class PokemonScraper
  def self.scrape_pokemon
    pokemon_url = "https://www.pokemon.com/us/pokedex/"
    pokemon_web = open(pokemon_url).read 
    parsed_html = Nokogiri::HTML(pokemon_web)
    binding.pry 
  end
  
end

PokemonScraper.scrape_pokemon