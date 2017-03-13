module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    verification_number = nums_a.pop
    sum = nums_a.reverse.map.with_index do |digit, index|
                              digit *= 2 if index.even?
                              digit.digits.sum
                            end
                            .reduce{ |n1, n2| n1 + n2 }
    (sum * 9) % 10 == verification_number ? true : false
  end
end
