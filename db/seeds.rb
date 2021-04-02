class Seed
  def self.begin
    seed = Seed.new
    seed.generate_boarders
  end

  def generate_boarders
    15.times do |i|
      boarder = Boarder.create!(
        name: Faker::Creature::Cat.unique.name,
        kind: "Cat",
        breed: Faker::Creature::Cat.breed,
        gender: Faker::Creature::Dog.gender,
        age: rand(1..8),
        description: Faker::Quote.unique.famous_last_words
      )
    end
    10.times do |i|
      boarder = Boarder.create!(
        name: Faker::Creature::Dog.unique.name,
        kind: "Dog",
        breed: Faker::Creature::Dog.breed,
        gender: Faker::Creature::Dog.gender,
        age: rand(1..8),
        description: Faker::Books::Dune.unique.quote
      )
    end
    puts "Successfully created #{Boarder.count} boarders!"
  end
end

Seed.begin
