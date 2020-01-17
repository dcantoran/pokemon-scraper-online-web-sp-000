class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db
  end 
  
  def save
    sql = "INSERT INTO Pokemon (id, name, type, db) VALUES (?,?,?,?)"
    DB[:conn].execute(sql, self.id, self.name, self.type, self.db)
  end 
  
end
