# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Load environment-specific seeds
puts "Loading seeds for #{Rails.env} environment..."
load(Rails.root.join("db", "seeds", "#{Rails.env}.rb"))

# Common seed data that should exist in all environments
puts "Loading common seed data..."

# Seed Harry Potter characters
puts "Seeding Harry Potter characters..."
Rake::Task['db:seed_hp_characters'].invoke

# Example of common data that should exist in all environments
# ["admin", "user", "guest"].each do |role_name|
#   Role.find_or_create_by!(name: role_name)
# end

