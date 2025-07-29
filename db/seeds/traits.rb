# Seed traits

[
  "Slytherin",
  "Hufflepuff", 
  "Ravenclaw",
  "Gryffindor",
  "Vampire",
  "Werewolf",
  "Veela",
  "Zombie",
  "Grey",
  "Dark",
  "Auror"
].each do |trait_name|
  Trait.find_or_create_by!(name: trait_name)
end

puts "Traits seeded successfully!" 