# frozen_string_literal: true

require 'debug'
require 'json'

class TextProperties
  def initialize(text)
    @text = text
  end

  def frequency_table
    @frequency_table ||= count_frequency_table
  end

  def entropy
    @entropy ||= -frequency_table.values.sum { |v| v * Math.log2(v) }
  end

  def rendundance
    @rendundance ||= 1 - entropy / 5
  end

  private

  attr_accessor :text

  def count_frequency_table
    counts = text.each_char.each_with_object(Hash.new(0)) do |char, memo|
      memo[char] += 1
    end.sort_by { |_k, v| v }.reverse.to_h

    counts.update(counts) { |_k, v| v = v.to_f / text.size }
  end
end

tp = TextProperties.new(File.read(ARGV[0]))
puts JSON.pretty_generate(tp.frequency_table)

puts tp.entropy
puts tp.rendundance
