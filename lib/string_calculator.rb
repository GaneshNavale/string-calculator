# frozen_string_literal: true

module StringCalculator
  def self.add(str)
    return 0 if str.empty?

    digits = str.split(/\n|#{delimiter(str)}/).map(&:to_i)

    negatiges = digits.select { |x| x.negative? }
    raise "negatives not allowed: #{negatiges.join(', ')}" if negatiges.any?

    digits.reduce { |sum, x| sum + x }
  end

  def self.delimiter(str)
    str.start_with?('//') ? str[2] : ','
  end
end
