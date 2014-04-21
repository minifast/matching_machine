module MatchingMachine
  class Participant < Struct.new(:name, :email, :absentee)
    def self.import_scholar(row)
      new(row[:scholar_name], row[:scholar_email], row[:scholar_absentee])
    end

    def self.import_guide(row)
      new(row[:guide_1_name], row[:guide_1_email], row[:guide_1_absentee])
    end

    def self.import_other_guide(row)
      new(row[:guide_2_name], row[:guide_2_email], row[:guide_2_absentee])
    end
  end
end
