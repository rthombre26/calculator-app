class Calculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.split(",").map(&:to_i).sum
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
