class Primes
  def self.sum_to(limit = 100)
    prime_number_array = Array.new(limit, true)

    square_root = Math.sqrt(limit)
    for i in 2..square_root.ceil
      if prime_number_array[i]
          w = i * i
          while w <= limit do
              prime_number_array[w] = false
              w += i
          end
      end
    end
    prime_number_array[0] = false;
    prime_number_array[1] = false;
    sum = 0
    for i in 2..limit
      if prime_number_array[i]
          sum += i
      end
    end
    return sum
  end
end