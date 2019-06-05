class Pokemon
  attr_accessor :name, :number, :description
  @@pokedex
  def initialize(name, number, description)
    @name = name
    @number = number
    @description = description
    @@pokedex << self
  end
  
  def catch_pokemon
    @@all.select{|c| c.is_a?(self)}.sample
  end
end