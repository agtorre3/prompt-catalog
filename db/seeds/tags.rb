# Seed tag categories
puts "Seeding tag categories..."
[
  "General Tropes",
  "Fandom Tropes",
  "Character",
  "Genre/Theme",
  "Canon Compliancy",
  "Warnings",
  "NSFW"
].each { |name| TagCategory.find_or_create_by!(name: name) }

puts "Seeding tags for general tropes..."
# Seed tags for each category
[
  "Dead Character Lives",
  "Found Family",
  "Coffee Shop AU",
  "Flower Shop AU",
  "Meet Cute",
  "Time Travel",
  "Medieval AU",
  "Fairytale AU",
  "Enemies to Lovers",
  "Slow Burn",
  "Mutual Pining",
  "Friends to Lovers",
  "Only one bed",
  "First Kiss",
  "Soulmate AU",
  "Dimension Travel",
  "College AU",
  "Fix It",
  "Fake Dating",
  "Drunken Confession",
  "Huddle for Warmth",
  "Royalty AU",
  "De-aging",
  "Historical AU",
  "Missing Scenes",
  "Arranged Marriage",
  "Unrequited Loves",
  "Miscommunication",
  "Time Loop",
  "Body Swap",
  "Amnesia",
  "Crossover",
  "Baby Fic",
  "Love Triangle",
  "Unhappy Ending",
  "Pregnancy",
  "Road Trip",
  "Hanahaki Disease",
  "Mythology AU",
  "Temporary Amnesia",
  "Bookshop AU",
  "Lovers to Enemies",
  "Body Swap",
  "Kid Fic"
].each do |general_trope|
  Tag.find_or_create_by!(name: general_trope, tag_category: TagCategory.find_by(name: 'General Tropes'))
end

puts "Seeding tags for fandom tropes..."
[
  "Voldemort Wins AU",
  "Muggle AU",
  "Raising Harry",
  "WBWL"
].each do |fandom_trope|
  Tag.find_or_create_by!(name: fandom_trope, tag_category: TagCategory.find_by(name: 'Fandom Tropes'))
end

puts "Seeding tags for genre/theme..."
[
  "Fluff",
  "Angst",
  "Hurt/Comfort",
  "Crack",
  "Romance",
  "Humor",
  "Dark",
  "Generic"
].each do |genre|
  Tag.find_or_create_by!(name: genre, tag_category: TagCategory.find_by(name: 'Genre/Theme'))
end

puts "Seeding tags for canon compliancy..."
[
  "Canon Compliant",
  "Canon Divergent",
  "Alternate Universe",
  "Alternate Dimension"
].each do |canon_compliancy|
  Tag.find_or_create_by!(name: canon_compliancy, tag_category: TagCategory.find_by(name: 'Canon Compliancy'))
end

puts "Seeding tags for warnings..."
[
  "Violence",
  "Sexual Content",
  "Violence",
  "Language",
  "Drug Use",
  "Alcohol Use",
  "Smoking",
  "Major Character Death",
  "Graphic Depictions of Violence"
].each do |warning|
  Tag.find_or_create_by!(name: warning, tag_category: TagCategory.find_by(name: 'Warnings'))
end

puts "Seeding tags for NSFW..."
[
  "ABO/Omegaverse",
  "Bang or Die",
  "Sex Pollen",
  "Friends with Benefits"
].each do |nsfw|
  Tag.find_or_create_by!(name: nsfw, tag_category: TagCategory.find_by(name: 'NSFW'))
end

puts "Tags seeded successfully!"