require 'pry'
require 'open-uri'
require 'nokogiri'

class PokemonScraper
  def self.scrape_pokemon
    #harvest
    poke_url = "https://rankedboost.com/pokemon-go/pokedex/"
    poke_html = open(poke_url).read 
    
    #filter
    parsed_pokemon = Nokogiri::HTML(poke_html)
    #here I get all the names 
    pokemon_names = parsed_pokemon.css("span.PokemonName").map(&:text)
    #this gives me all the links 
    
    parsed_pokemon.css("span.pokemontypeImgs a").collect do |pok_link|
      pokemon_links = pok_link.attribute('href').value
    end
  
  end #end method 
end

#PokemonScraper.scrape_pokemon