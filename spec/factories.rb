FactoryBot.define do
  factory :boarder do
    name { Faker::Creature::Cat.name }
    kind { ["Cat", "Dog"].sample }
    breed { Faker::Creature::Cat.breed }
    gender { Faker::Creature::Dog.gender }
    age { rand(1..8) }
    description { Faker::Quote.famous_last_words }
    branch
  end

  factory :branch do
    location { Faker::Address.city }

    factory :branch_with_boarders do
      transient do
        boarders_count { 15 }
      end
      after(:create) do |branch, evaluator|
        create_list(:boarder, evaluator.boarders_count, branch: branch)
        branch.reload
      end
    end
  end
end
