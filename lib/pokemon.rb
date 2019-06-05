class Pokemon 
  attr_accessor :name, :profile_url, :pokemon_generation, :pokedex_number, :pokemon_type, :description
  @@pokedex = [] 
  @@all = []
  def initialize(pokemon_hash)
    pokemon_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_pokedex(pokemon_array)
    pokemon_array.each do |pokemon|
      self.new(pokemon)
    end
  end

  def add_poke_card(poke_card_hash)
     poke_card_hash.each do |key, value|
      self.send(("#{key}="), value)
     end 
  end #end pokecard

  def self.all
    @@all
  end
end #end class
