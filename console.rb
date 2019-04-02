require('pry-byebug')
require_relative('bounty_hunter.rb')

hunter1 = BountyHunter.new({'name' =>'Boba Fett',
                          'species' => 'Human Clone',
                          'homeworld' => 'Kamino',
                          'favourite_weapon' => 'blaster'
                        })
hunter1.save()

hunter2 = BountyHunter.new({'name' => 'Bossk',
                          'species'=> 'Trandoshan',
                          'homeworld' => 'Trandosha',
                          'favourite_weapon' => 'mid-range sniper'
                          })
hunter2.save()

hunters = BountyHunter.all()

hunters.find_by_name = .

# SELECT 
binding.pry
