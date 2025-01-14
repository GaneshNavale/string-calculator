module StringCalculator
  def self.add(str)
    return 0 if str.empty?

    digits = str.split(',').map(&:to_i)
    sum = digits.reduce {|sum, x| sum += x }
  end
end
