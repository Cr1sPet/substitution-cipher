# frozen_string_literal: true

module SubstitutionCipher
  class ResultSaver
    def self.save_file(...) = new(...).save_file

    def initialize(filename:, data:)
      @filename = filename
      @data = data
    end

    def save_file
      File.write(filename, data)
    end

    private

    attr_reader :filename, :data
  end
end
