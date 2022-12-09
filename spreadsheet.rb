require 'roo'

module ImportParts
  class Spreadsheet
    HEADER_MAX_LINE = 100
    attr_reader :xlsx, :header_line

    def initialize(file)
      @xlsx = Roo::Spreadsheet.open(file)
    end

    def sheet
      xlsx.sheet(0)
    end

    def header_detect(mappings)
      line_num = 0
      closest_mismatched_headers = []
      sheet.each do |row|
        line_num += 1

        mappings.each_with_index do |mapping, index|
          headers = mapping.map { |k,v| row.grep(v)[0] }.compact

          if headers.length == mapping.length
            @header_line = line_num
            return mapping
          else
            closest_mismatched_headers = headers if headers.length > closest_mismatched_headers.length
            if line_num > HEADER_MAX_LINE
              break
            end
          end
        end
      end
      missing_headers = mappings.select { |q| closest_mismatched_headers.grep(q).empty? }
      raise Roo::HeaderRowNotFoundError, missing_headers
    end
  end
end