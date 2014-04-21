require "matching_machine/version"

module MatchingMachine
  def self.root
    Pathname.new(File.expand_path('..', __FILE__))
  end
end

require "matching_machine/merger"
