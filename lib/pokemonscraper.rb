require 'pry'
require 'open-uri'
require 'nokogiri'

class PokeScraper
def self.scrape_pokemon
all = []
#harvest
poke_url = "https://rankedboost.com"
poke_html = open(poke_url+"/pokemon-go/pokedex").read
take_num = 10

#filter

parsed_pokemon = Nokogiri::HTML(poke_html)

#this gives me all the names 

pokemon_names = parsed_pokemon.css("span.PokemonName").map(&:text)
reduced_pokemon = pokemon_names.take(take_num)

#this gives me all the links 
array_links = []
parsed_pokemon.css("span.pokemontypeImgs a").collect do |pok_link|
  array_links << pok_link.attribute('href').value
end
reduced_link_array = array_links.take(take_num)

i = 0 
while i<reduced_pokemon.length
      all << {:name => reduced_pokemon[i], :profile_url => reduced_link_array[i]}
      i += 1
      end
      return all
  end 
    #puts pokemon_names.sample

#scraping the 2nd link with all the info 

def self.scrape_link(pokemon_link)
  poke_profile_html = open(pokemon_link).read
  parsed_poke_profile = Nokogiri::HTML(poke_profile_html)
  pokemon_info = parsed_poke_profile.css('.PokemonIDDiv').text
  pokemon_number = pokemon_info.split(" - ")[1].delete("#").to_i
  pokemon_gen = pokemon_info.split(" - ")[0]
  pokemon_info_type = parsed_poke_profile.css('th.PokemonWeightText').map(&:text)
  pokemon_type = pokemon_info_type[1]
  pokemon_description = parsed_poke_profile.css('td.PokedexEntryText').text
  pokemon_card = {:pokemon_generation => pokemon_gen, :pokedex_number => pokemon_number, :pokemon_type => pokemon_type, :description => pokemon_description}
end
end #class 