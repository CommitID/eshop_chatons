20.times do
  Item.create(title: Faker::Creature::Cat.name,
              description: Faker::Lorem.sentence,
              price: rand(100..500),
              picture: Faker::Lorem.word)
end
