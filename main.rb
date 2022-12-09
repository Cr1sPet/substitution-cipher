require_relative 'mapping'
require_relative 'spreadsheet'
require_relative 'row_wrapper'

include ImportParts

begin
  filename = ARGV[0]
  spread_sheet = Spreadsheet.new(filename)
  header = spread_sheet.header_detect(Mapping.new.mappings)

  last_row = spread_sheet.sheet.last_row - spread_sheet.header_line

  spread_sheet.sheet.parse(header).each_with_index do |row, index|
    row_wrapper = RowWrapper.new(row: row, row_index: index)

    next if index.between?(3, last_row-4)
    puts row_wrapper.to_json
  end

rescue => err
  if err.class == TypeError
    puts 'Ошибка: недействительное имя файла'
  elsif err.class == Roo::HeaderRowNotFoundError
    puts 'Ошибка: файл имеет недопустимый формат'
    puts err.message
  else
    puts err.class
    puts err.message
  end
end