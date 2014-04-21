require 'erb'
require 'ostruct'
require 'matching_machine/participant'
require 'matching_machine/importer'

module MatchingMachine
  class Merger < Struct.new(:scholar, :guide, :other_guide)
    def self.import(path)
      Importer.import(path).map do |scholar, guide, other_guide|
        new(scholar, guide, other_guide)
      end
    end

    def scholar_email
      scholar_template.result(binding)
    end

    def guide_emails
      emails = [guide_template.result(guide_binding)]
      emails << guide_template.result(other_guide_binding) unless other_guide.nil?
      emails
    end

    protected

    def guide_binding
      OpenStruct.new(guide: guide, scholar: scholar).instance_eval { binding }
    end

    def other_guide_binding
      OpenStruct.new(guide: other_guide, scholar: scholar).instance_eval { binding }
    end

    def guide_template
      ERB.new(guide_template_path.read)
    end

    def scholar_template
      ERB.new(scholar_template_path.read)
    end

    def scholar_template_path
      MatchingMachine.root.join('templates', 'scholar.erb')
    end

    def guide_template_path
      MatchingMachine.root.join('templates', 'guide.erb')
    end
  end
end
