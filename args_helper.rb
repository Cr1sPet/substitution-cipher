# frozen_string_literal: true

module ArgsHelper
  def encode?
    ARGV.include?('--encode')
  end

  def decode?
    ARGV.include?('--decode')
  end

  def without_mode?
    !ARGV.include?('--decode') && !ARGV.include?('--encode')
  end

  def text_info?
    ARGV.include?('--text_info')
  end

  def key_generate?
    ARGV.include? '--key_generate'
  end

  def check_args
    return unless ARGV.size.zero? || (ARGV.size == 1 && ARGV.include?('--help'))

    puts args_help
    exit
  end

  def args_help
    "###############
    Allowed params:
    - 'filename'
    - --encode
    - --decode
    - --key_generate
    - --text_info"
  end
end
