# frozen_string_literal: true

module StringCalculator
  def self.add(str)
    return 0 if str.empty?

    digits = extract_digits(str)

    negatives = digits.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    digits.sum
  end

  def self.delimiter(str)
    str.start_with?('//') ? str[2] : ','
  end

  def self.extract_digits(str)
    str.split(/\n|#{delimiter(str)}/).map(&:to_i)
  end
end
