class Pokemon
    attr_accessor :id, :name, :type, :db


    def initialize (id:, name:, type:, db:)
        @id= id
        @name= name
        @type= type
        @db= db
    end
    
    
        

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name, type]) 
    end

    def self.find(id , db)
    pokemon_row= db.execute("SELECT * FROM pokemon WHERE id= ?", id)[0]
    Pokemon.new(id: pokemon_row[0], name: pokemon_row[1], type: pokemon_row[2], db: db)
    end
end
