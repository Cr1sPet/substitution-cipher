# frozen_string_literal: true

module SubstitutionCipher
  class KeyGenerator
    def self.call(...) = new(...).call

    def initialize
      @values = abc.dup
    end

    def call
      @key = generate
      ResultSaver.save_file(filename: Constants::KEY_FILENAME, data: key)
      @key
    end

    private

    def abc
      Constants::RU_ABC
    end

    attr_accessor :values
    attr_reader :update_saved_key, :key

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
