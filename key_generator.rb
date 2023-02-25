# frozen_string_literal: true

module SubstitutionCipher
  class KeyGenerator
    def self.call(...) = new(...).call

    def initialize
      @values = abc.dup
    end

    def call
      puts "================\nkey generation"
      @key = generate
      save_json(Constants::KEY_FILENAME, key)
      @key
    end

    private

    def abc
      Constants::RU_ABC
    end

    attr_accessor :values
    attr_reader :update_saved_key, :key

    def generate
      abc.each_char.with_object({}) do |ch, key|
        key[ch] = get_value(ch)
      end
    rescue RuntimeError => e
      retry
    end

    def get_value(except)
      val = values[rand(values.size)]

      while val == except
        raise RuntimeError if values.length == 1

        val = values[rand(values.size)]
      end

      values.delete!(val)
      val
    end
  end
end
