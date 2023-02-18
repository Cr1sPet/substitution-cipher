# frozen_string_literal: true

module SubstitutionCipher
  class KeyGenerator
    def self.call(...) = new(...).call

    def initialize
      @values = abc.dup
    end

    def call
      generate
    end

    private

    def abc
      RU_ABC
    end

    RU_ABC = [*'а'..'я'].join('').concat(' ')

    attr_accessor :values

    def generate
      abc.split('').each_with_object({}) do |ch, memo|
        memo[ch] = get_value(ch)
      end
    end

    def get_value(except)
      val = values[rand(values.size)]

      val = values[rand(values.size)] while val == except

      values.delete!(val)
      val
    end
  end
end
