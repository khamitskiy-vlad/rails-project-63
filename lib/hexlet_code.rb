# frozen_string_literal: true

require_relative "hexlet_code/version"
# autoload(:Tag, "lib/hexlet_code/tag.rb")

module HexletCode
  class Error < StandardError; end
  
  class Tag
    def self.build(name, options = {})
      paired_tags = %w[html table label form span ul p head div]
      opening_tag = opening_tag(name)
      attributes = attributes(options)
      pair_body = yield if block_given?
      
      html_form = [] << tag_with_attributes_joiner(opening_tag, attributes)

      if paired_tags.include?(name)
        html_form << pair_body << "</#{name}>"
        html_form.join
      else
        html_form.join
      end
    end

    def self.tag_with_attributes_joiner(open, attr)
      array = [] << open
      if attr.empty?
        array
      else
        array << " #{attr}"
      end
      array << ">"
    end 

    def self.opening_tag(name)
      string = "<#{name}"
    end
    
    def self.attributes(options)
      array = []
      options.each do |key, value|
        array << "#{key}=\"#{value}\""
      end
      array.join(" ")
    end
  end
end
