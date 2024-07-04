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
