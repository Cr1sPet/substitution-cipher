# frozen_string_literal: true

module SubstitutionCipher
  class PlainParser
    def self.call(...) = new(...).call

    def initialize(plain:)
      @plain = plain
    end

    def call
      parsed = plain.downcase.gsub(/[^а-я ]/, '')
    end

    private

    attr_reader :plain
  end
end
