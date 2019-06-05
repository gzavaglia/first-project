require 'pry'
class Pokemon
  attr_accessor :name, :number, :description
  @@pokedex
  def initialize(name, number, description)
    @name = name
    @number = number
    @description = description
    @@pokedex << self
  end
  
  def self.catch_pokemon
    PokemonScraper.scrape_pokemon.sample
    
    @@pokedex.select{|c| c.is_a?(self)}.sample
    
  end
  
  def self.pokedex
    @@pokedex
  end
end

