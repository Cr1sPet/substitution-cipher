# frozen_string_literal: true

class FileReader
  def self.read(file_name)
    raise 'Input filename is invalid' if file_name.nil? || !File.readable?(file_name)

    File.read(file_name)
  end
end
