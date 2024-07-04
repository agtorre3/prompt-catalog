# frozen_string_literal: true

namespace :db do
  desc 'Seed db with Harry Potter characters from potterdb'
  task seed_hp_characters: :environment do
    response = Services::PotterDbService.characters

    loop do
      add_characters(response)

      links = response['links']
      next_link = links['next']

      if next_link.nil?
        break
      else
        response = Services::PotterDbService.characters(next_link)
      end
    end
  end
end

def add_characters(response)
  data = response['data']
  data.each do |character|
    puts character['attributes']['name']
  end
end

def do_not_save?(character)
  character['attributes']['name'].include?(strings_to_exclude)
end

def strings_to_exclude
  %w[woman man 's s' Unidentified unidentified "at the" "in the" "in a" "of the" father mother broomsticks Broomsticks Third Professor professor Inquisitorial haired Haired muggle Muggle young]
end

# exclude - Quidditch? Player? Portrait? "of a"?

# exclude words 'boy' 'girl', etc. but they need to be an exact word match

# Notes: Edward Remus Lupin should be searchable by alias "Teddy Lupin"