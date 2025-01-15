# frozen_string_literal: true

module StringCalculator
  def self.add(str)
    return 0 if str.empty?

    digits = extract_digits(str)

    negatives = digits.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    digits.reduce(0) { |sum, digit| sum += (digit <= 1000 ? digit : 0) }
  end

  def self.delimiter(str)
    if str.start_with?('//')
      match = str.match(%r{//\[(.*?)\]\n})
      match ? match[1] : str[2]
    else
      ','
    end
  end

  def self.extract_digits(str)
    delim = delimiter(str)
    numbers_str = str.start_with?('//') ? str.split("\n", 2).last : str
    numbers_str.split(/#{Regexp.escape(delim)}|\n/).map(&:to_i)
  end
end
