require ('pg')

class BountyHunter

attr_accessor :name, :species, :homeworld, :favourite_weapon

def initialize(options)
  @name = options ['name']
  @species = options ['species']
  @homeworld = options ['homeworld']
  @fav_weapon = options ['favourite_weapon']
  @id =options ['id'].to_i if options ['id']

end

def save()
# connect db
# prepare sql statement
# create values for prep statement
# run prep state
# close db

db = PG connect( {dbname: 'bounty_hunter',
                  host: 'localhost'
                  })
sql = "INSERT INTO bounty_hunter (
  name,
  species,
  homeworld
  favourite_weapon)
  VALUES ($1,$2,$3,$4)
  RETURNING id
  "

  values = [@name, @species, @homeworld, @favourite_weapon]
  db.prepare('save',sql)
  db.exec_prepared('save', values)[0]['id'].to_i
  db.close
end


# UPDATE
# connect db
# prepare sql statement
# create values for prep statement
# run prep state
# close db

def update()
db = PG connect( {dbname: 'bounty_hunter',
                    host: 'localhost'
                    })
sql = "UPDATE bounty_hunters
SET (name,
  species,
  homeworld,
  favourite_weapon
  )=(
    $1, $2, $3, $4
    )
    WHERE id = $5
    "

values = [@name, @species, @homeworld, @favourite_weapon]
db.prepare('update',sql)
    db.exec_prepared('update', values)
    db.close
end


# DELETE all
# connect to db
# sql statement string
# prep statement
# exec statement
# close db

def BountyHunter.delete_all()
  db = PG connect( {dbname: 'bounty_hunter',
                      host: 'localhost'
                      })
sql = "DELETE from bounty_hunter"
db.prepare('delete_all', sql)
db.exec_prepared('delete_all')
db.close
end

# DELETE single
# connect to db
# sql statement string
# prep statement
# exec statement
# close db
def delete()
  db = PG connect( {dbname: 'bounty_hunter',
                      host: 'localhost'
                      })
  sql = 'DELETE from bounty_hunter'
  db.prepare('delete_one', sql)
  db.exec_prepared('delete_one', value)
  db.close()
end


# find_by_name
def BountyHunter.find_by_name(name)
# connect to db
db = PG connect( {dbname: 'bounty_hunter',
                    host: 'localhost'
                    })
# sql statement string
sql = 'SELECT name FROM bounty_hunter'
# prep statement
db.prepare('find_by_name', sql)
# exec statement
db.exec_prepared('find_by_name', value)
# close db
db.close
end
end
