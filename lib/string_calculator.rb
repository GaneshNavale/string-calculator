module StringCalculator
  def self.add(str)
    return 0 if str.empty?

    if str.start_with?('//')
      delimiter = str[2]
      digits = str.split(/\n|#{delimiter}/).map(&:to_i)
    else
      digits = str.split(/\n|,/).map(&:to_i)
    end
    digits.reduce { |sum, x| sum + x }
  end
end
