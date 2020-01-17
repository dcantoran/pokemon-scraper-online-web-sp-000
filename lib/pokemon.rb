class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end 
  
  def self.find(num, db)
    # poke = db.execute("SELECT * FROM pokemon WHERE id = ?", [lookup_id])
    # new_pokemon = self.new(poke[0][0], poke[0][1], poke[0][2], poke[0][3])
    # # new_pokemon[:id] = poke[0][0]
    # # new_pokemon[:name] = poke[0][1]
    # # new_pokemon[:type] = poke[0][2]
    # # new_pokemon[:db] = poke[0][3]
    # new_pokemon
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end 
  
end
