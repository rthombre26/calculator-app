class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /[\n,]/  # Default delimiters: newline and comma

    # Check for custom delimiter format "//[delimiter]\n[numbers]"
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2) # Split into [delimiter, numbers]
      
      if parts[0].match(/\A\/\/\[(.+)\]\z/) # Multi-character delimiter
        delimiter = Regexp.new(Regexp.escape($1))
      elsif parts[0].match(/\A\/\/(.+)\z/)  # Single-character delimiter
        delimiter = Regexp.escape($1)
      end

      numbers = parts[1] # Update numbers string
    end

    num_array = numbers.split(/#{delimiter}/).map(&:to_i)

    # Find negative numbers
    negatives = num_array.select { |n| n.negative? }
    raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.any?

    # Ignore numbers greater than 1000
    num_array.reject { |n| n > 1000 }.sum
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    raise ZeroDivisionError, "Cannot divide by zero" if b.zero?
    a / b
  end

end
