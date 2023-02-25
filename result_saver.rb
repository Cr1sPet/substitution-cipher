# frozen_string_literal: true

module SubstitutionCipher
  module ResultSaver
    def save_text(filename, data)
      File.write(filename, data)
      puts "result saved to #{filename}"
    end

    def save_json(filename, data)
      File.write(filename, JSON.pretty_generate(data))
      puts "result saved to #{filename}"
    end
  end
end
