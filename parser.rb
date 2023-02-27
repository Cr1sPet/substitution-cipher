# frozen_string_literal: true

class Parser
  def self.parse
    options = {}
    OptionParser.new do |opt|
      opt.on('-inFILENAME', '--input_file FILENAME') { |o| options[:input_file] = o }
      opt.on('-oFILENAME', '--output_file FILENAME') { |o| options[:output_file] = o }
      opt.on('-mENCODE|DECODE', '--mode ENCODE|DECODE|KEY') { |o| options[:mode] = o }
      opt.on('-h', '--help', 'Prints this help') do
        puts opt
        exit
      end
    end.parse!
    options
  end
end
