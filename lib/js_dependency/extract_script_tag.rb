# frozen_string_literal: true

module JsDependency
  class ExtractScriptTag
    # @param [String] str
    def initialize(str)
      @str = str
    end

    # @return [Array<String>]
    def call
      str = @str
      scripts = str.gsub(%r{<script>(.+)</script>}m).with_object([]) do |_, list|
        list << Regexp.last_match(1)
      end

      scripts.uniq.sort.join("\n")
    end

    def self.call(str)
      new(str).call
    end
  end
end