class Seed
  def self.begin
    seed = Seed.new
    Branch.destroy_all
    seed.generate_boarders
  end
  
  def generate_boarders
    locations = [
      'North Portland',
      'Northeast',
      'Northwest',
      'Southeast',
      'Southwest'
    ]
    
    locations.each do |location|
      branch = Branch.create!(location: location)
      rand(5..10).times do |i|
        boarder = Boarder.create!(
          name: Faker::Creature::Cat.name,
          kind: "Cat",
          breed: Faker::Creature::Cat.breed,
          gender: Faker::Creature::Dog.gender,
          age: rand(1..8),
          description: Faker::Quote.famous_last_words,
          branch_id: branch.id
        )
      end
      rand(5..10).times do |i|
        boarder = Boarder.create!(
          name: Faker::Creature::Dog.name,
          kind: "Dog",
          breed: Faker::Creature::Dog.breed,
          gender: Faker::Creature::Dog.gender,
          age: rand(1..8),
          description: Faker::Books::Dune.quote,
          branch_id: branch.id
        )
      end
    end
    puts "Successfully created #{Branch.count} branches with a total of #{Boarder.count} boarders!"
  end
end

Seed.begin
