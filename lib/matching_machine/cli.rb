require 'matching_machine'
require 'thor'
require 'pathname'

module MatchingMachine
  class Cli < Thor
    desc "merge FILE", "Merges the file and outputs all the templates"
    def merge(path)
      MatchingMachine::Merger.import(Pathname.new(path)).each do |merger|
        puts ("*" * 80)
        puts "Scholar email:"
        puts
        puts merger.scholar_email
        puts
        puts
        puts "Guide emails:"
        puts
        merger.guide_emails.each { |email| puts email; puts }
        puts
        puts
        puts ("*" * 80)
      end
    end
  end
end
