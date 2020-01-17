class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type
    @db = db
  end 
  
  def save
    sql = "INSERT INTO Pokemon (name, type, db) VALUES (?,?,?,?)"
    DB[:conn].execute(sql, self.name, self.type, self.db)
    @id = DB[:conn].execute("SELECT last_entry_rowid()")[0][0]
  end 
  
end
