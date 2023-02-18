# frozen_string_literal: true

module SubstitutionCipher
  class PlainParser
    def self.call(...) = new(...).call

    def initialize(plain:)
      @plain = plain
    end

    def call
      plain.downcase.split('').select { |el| [*'а'..'я'].join('').concat(' ').to_s.include? el }.join
    end

    private

    attr_reader :plain
  end
end
