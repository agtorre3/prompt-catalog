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

#TODO exclude animals (check "species" field)
def add_characters(response)
  data = response['data']
  data.each do |character|
    Character.create(name: character['attributes']['name']) unless do_not_save?(character)
  end
end

def do_not_save?(character)
  strings_to_exclude.any? { |string| character['attributes']['name'].include?(string) }
end

def strings_to_exclude
  %w[woman Woman girl Girl boy Boy 's s' Unidentified unidentified Undentified father mother broomsticks Actor sorcerer maid
  Broomstick broomstick Third Professor professor Inquisitorial haired Haired muggle Muggle young Quidditch potions portrait Portrait player
  Painting owner Owner worker wizard Wizard name Name author Author milkman cook Cook Greek Gringotts Head Minister student Warlock
  Student family Bloke Boil-ridden Ministry shopkeeper Horntail enthusiast groundskeeper Cauldron sister child Magic Waiter Waitress
  brother Brother Surrey Radcliffe Prefect No-Maj Paint ghost Ghost Forest President Snatcher face Witch Aged Fugitive Wandkeeper
  Hogwarts creature Creature Gigantic Goblet Goblin goblin God Jesus Greywing Group Poltergeist Hawk-Like Healer Horny-Handed Wandless
  Hogsmeade seller Individual Rowling Knight Manager wife nieces Mr Music NYPD guard salesman wearing bust Cromer Captain Unknown Vampire
  at\ the in\ the in\ The in\ a of\ the of\ The Gryffindor\ man Gryffindor\ Lad  Ravenclaw\ Lad House\ of Miss\ Granger Ms\ Weasley Old\ man
  Stephen\ Hawking The\ Marauders The\ Toad The\ White\ Wolf Trio\ of William\ Shakespeare Winston\ Churchill Mozart]
end

# Notes: Edward Remus Lupin should be searchable by alias "Teddy Lupin"
# Excluded "Mr" but want Mrs Norris
