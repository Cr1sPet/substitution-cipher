# frozen_string_literal: true

require 'debug'
require 'json'
require_relative 'constants'

class TextProperties
  def initialize(text)
    @text = text
  end

  def frequency_table
    @frequency_table ||= count_frequency_table
  end

  def frequency_table_pretty
    @frequency_table_pretty ||= JSON.pretty_generate(frequency_table)
  end

  def entropy
    @entropy ||= -frequency_table.values.sum { |v| v * Math.log2(v) }
  end

  def rendundance
    @rendundance ||= 1 - entropy / 5
  end

  def extract
    puts "==============
Frequency table:
#{frequency_table_pretty}
Entropy:
#{entropy}
Rendundance:
#{rendundance}"
  end

  private

  attr_accessor :text

  def count_frequency_table
    counts = text.each_char.each_with_object(Hash.new(0)) do |char, memo|
      memo[char] += 1
    end
    counts.update(counts) { |_k, v| v.to_f / text.size }.sort_by { |_k, v| v }.reverse.to_h
  end
end
