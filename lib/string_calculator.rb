module StringCalculator
  def self.add(str)
    return 0 if str.empty?

    digits = str.split(/\n|,/).map(&:to_i)
    digits.reduce { |sum, x| sum + x }
  end
end
