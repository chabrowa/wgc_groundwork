class Primes
  def self.sum_to(limit = 100)
    upperB = 100
    prime_number_array = Array.new(upperB, true)

    square_root = Math.sqrt(upperB)
    for i in 2..square_root.to_i
      if prime_number_array[i]
          w = i * i
          while w <= upperB do
              prime_number_array[w] = false
              w += i
          end
      end
    end
    prime_number_array[0] = false;
    prime_number_array[1] = false;
    for i in 2..upperB
      if prime_number_array[i]
          print i
      end
    end
    return "gfcvjgbvjughb"
  end
end