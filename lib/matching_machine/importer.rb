require 'csv'
require 'matching_machine/participant'
require 'matching_machine/importer'

module MatchingMachine
  class Importer < Struct.new(:path)
    def self.import(path)
      new(path).to_arrays
    end

    def to_arrays
      entries.map do |row|
        result = [
          Participant.import_scholar(row),
          Participant.import_guide(row),
        ]
        other_guide = Participant.import_other_guide(row)
        result << other_guide unless other_guide.email.nil?
        result
      end
    end

    protected

    def entries
      @entries ||= CSV.new(content, headers: true, header_converters: :symbol).entries
    end

    def content
      @content ||= path.read
    end
  end
end
