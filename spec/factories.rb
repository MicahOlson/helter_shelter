FactoryBot.define do
  factory(:branch) do
    location { Faker::Address.city }
  end

  factory(:boarder) do
      name { Faker::Creature::Cat.name }
      kind { "Cat"}
      breed { Faker::Creature::Cat.breed }
      gender { Faker::Creature::Dog.gender }
      age { rand(1..8) }
      description { Faker::Quote.famous_last_words }
      branch
  end
end
